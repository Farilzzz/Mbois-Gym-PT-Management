import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:http/http.dart' as http;

import 'app_database.dart';

class ExerciseApiService {
  static const String baseUrl = 'https://wger.de/api/v2/exerciseinfo/?limit=25';
  static const Duration defaultTimeout = Duration(seconds: 6);
  static const int defaultMaxPages = 3;

  /// Formats known wger license IDs without making blanket CC4 claims.
  /// License 1: CC-BY-SA 3
  /// License 2: CC-BY-SA 4
  /// License 3: CC0
  /// License 4: CC-BY 4
  /// License 5: ODbL
  static String formatLicense(dynamic license) {
    if (license == null) return '';
    final s = license.toString().trim();
    return switch (s) {
      '1' => 'CC-BY-SA 3',
      '2' => 'CC-BY-SA 4',
      '3' => 'CC0',
      '4' => 'CC-BY 4',
      '5' => 'ODbL',
      _ => s,
    };
  }

  /// Builds attribution text stored in the `source` column of [ExerciseCatalog].
  static String buildSource({dynamic license, String? author}) {
    final lic = formatLicense(license);
    final auth = author?.trim();
    final parts = <String>[];
    if (lic.isNotEmpty) parts.add('license: $lic');
    if (auth != null && auth.isNotEmpty) parts.add('author: $auth');
    if (parts.isEmpty) return 'wger_api';
    return 'wger_api (${parts.join(', ')})';
  }

  /// Fetches public exercises from wger API (no API key required) and caches into SQLite.
  /// Handles network failure, timeout, and duplicate entries gracefully.
  /// Bounded pagination up to [maxPages] (max 3 pages, 25 items each).
  /// Accurately counts newly inserted catalog rows without duplicates.
  /// Preserves static syncFromWger(db) returning (int, String?).
  static Future<(int, String?)> syncFromWger(
    AppDatabase db, {
    http.Client? client,
    Duration timeout = defaultTimeout,
    int maxPages = defaultMaxPages,
    String initialUrl = baseUrl,
  }) async {
    final effectiveClient = client ?? http.Client();
    final shouldCloseClient = client == null;

    final candidates = <_ExerciseSyncCandidate>[];

    try {
      String? nextUrl = initialUrl;
      int pagesFetched = 0;

      while (nextUrl != null && nextUrl.isNotEmpty && pagesFetched < maxPages) {
        final http.Response response;
        try {
          response = await effectiveClient
              .get(Uri.parse(nextUrl))
              .timeout(timeout);
        } on TimeoutException {
          return (
            0,
            'Koneksi API offline/timeout. Menggunakan katalog lokal bawaan.',
          );
        } on SocketException {
          return (
            0,
            'Koneksi API offline/timeout. Menggunakan katalog lokal bawaan.',
          );
        } on http.ClientException {
          return (
            0,
            'Koneksi API offline/timeout. Menggunakan katalog lokal bawaan.',
          );
        } catch (e) {
          return (
            0,
            'Koneksi API offline/timeout. Menggunakan katalog lokal bawaan.',
          );
        }

        if (response.statusCode != 200) {
          return (
            0,
            'Gagal mengambil data dari server wger (HTTP ${response.statusCode})',
          );
        }

        final Map<String, dynamic> data;
        try {
          data = jsonDecode(response.body) as Map<String, dynamic>;
        } catch (e) {
          return (
            0,
            'Gagal mengambil data dari server wger (format tidak valid)',
          );
        }

        final results = data['results'] as List<dynamic>? ?? [];
        for (final item in results) {
          if (item is! Map<String, dynamic>) continue;

          // Map category name
          final categoryRaw = item['category'];
          String categoryName = 'General';
          if (categoryRaw is Map<String, dynamic>) {
            final name = categoryRaw['name']?.toString().trim();
            if (name != null && name.isNotEmpty) {
              categoryName = name;
            }
          } else if (categoryRaw != null) {
            final name = categoryRaw.toString().trim();
            if (name.isNotEmpty) {
              categoryName = name;
            }
          }

          // Map English translation (language == 2)
          final translations = item['translations'] as List<dynamic>? ?? [];
          Map<String, dynamic>? englishTrans;
          for (final t in translations) {
            if (t is Map<String, dynamic>) {
              final lang = t['language'];
              if (lang == 2 || lang?.toString() == '2') {
                final name = t['name']?.toString().trim();
                if (name != null && name.isNotEmpty) {
                  englishTrans = t;
                  break;
                }
              }
            }
          }

          if (englishTrans == null) continue;

          final exerciseName = englishTrans['name'].toString().trim();
          final license = englishTrans['license'];
          final author = englishTrans['license_author']?.toString().trim();
          final sourceText = buildSource(license: license, author: author);
          final externalId = item['id'] as int?;

          candidates.add(
            _ExerciseSyncCandidate(
              name: exerciseName,
              category: categoryName,
              source: sourceText,
              externalId: externalId,
            ),
          );
        }

        pagesFetched++;
        nextUrl = data['next']?.toString();
      }
    } finally {
      if (shouldCloseClient) {
        effectiveClient.close();
      }
    }

    // Insert candidates in an atomic database transaction
    int addedCount = 0;
    try {
      await db.transaction(() async {
        final seenInBatch = <String>{};
        for (final candidate in candidates) {
          final dedupeKey =
              '${candidate.name.toLowerCase()}:::${candidate.category.toLowerCase()}';
          if (seenInBatch.contains(dedupeKey)) continue;
          seenInBatch.add(dedupeKey);

          // Check if already in database (accurate newly inserted count)
          final existing =
              await (db.select(db.exerciseCatalog)..where(
                    (tbl) =>
                        tbl.name.equals(candidate.name) &
                        tbl.category.equals(candidate.category),
                  ))
                  .getSingleOrNull();

          if (existing == null) {
            await db
                .into(db.exerciseCatalog)
                .insert(
                  ExerciseCatalogCompanion.insert(
                    name: candidate.name,
                    category: candidate.category,
                    source: Value(candidate.source),
                    externalId: Value(candidate.externalId),
                  ),
                );
            addedCount++;
          }
        }
      });
    } catch (e) {
      return (0, 'Gagal menyimpan transaksi database: $e');
    }

    return (addedCount, null);
  }
}

class _ExerciseSyncCandidate {
  final String name;
  final String category;
  final String source;
  final int? externalId;

  const _ExerciseSyncCandidate({
    required this.name,
    required this.category,
    required this.source,
    this.externalId,
  });
}
