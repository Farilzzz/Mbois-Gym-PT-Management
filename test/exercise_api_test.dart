import 'dart:convert';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mbois_gym_pt/data/app_database.dart';
import 'package:mbois_gym_pt/data/exercise_api_service.dart';

Map<String, dynamic> page(List<Map<String, dynamic>> results, {String? next}) =>
    {'results': results, 'next': next};

Map<String, dynamic> exercise({
  required int id,
  required String name,
  String category = 'Legs',
  Object? license = 2,
  String? author = 'catalogue contributor',
}) => {
  'id': id,
  'category': {'name': category},
  'translations': [
    {
      'language': 2,
      'name': name,
      'license': license,
      'license_author': ?author,
    },
  ],
};

void main() {
  late AppDatabase db;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    await db.delete(db.exerciseCatalog).go();
  });
  tearDown(() => db.close());

  test(
    'syncs at most three pages and stores English category attribution',
    () async {
      final requested = <Uri>[];
      final client = MockClient((request) async {
        requested.add(request.url);
        final offset = request.url.queryParameters['offset'];
        final body = switch (offset) {
          null => page([
            exercise(id: 1, name: 'English one'),
          ], next: 'https://test.invalid/p2'),
          '2' => page([
            exercise(id: 2, name: 'English two'),
          ], next: 'https://test.invalid/p3?offset=3'),
          '3' => page([
            exercise(id: 3, name: 'English three'),
          ], next: 'https://test.invalid/p4'),
          _ => fail('fourth page must not be requested'),
        };
        // Make the second URL explicit, while testing that API next links are followed.
        if (request.url.path == '/p2') {
          return http.Response(
            jsonEncode(
              page([
                exercise(id: 2, name: 'English two'),
              ], next: 'https://test.invalid/p3?offset=3'),
            ),
            200,
          );
        }
        return http.Response(jsonEncode(body), 200);
      });

      final result = await ExerciseApiService.syncFromWger(db, client: client);

      expect(result, (3, null));
      expect(requested, hasLength(3));
      final rows = await db.select(db.exerciseCatalog).get();
      expect(
        rows.map((row) => row.name),
        containsAll(['English one', 'English two', 'English three']),
      );
      final first = rows.singleWhere((row) => row.externalId == 1);
      expect(first.category, 'Legs');
      expect(
        first.source,
        'wger_api (license: CC-BY-SA 4, author: catalogue contributor)',
      );
    },
  );

  test('counts only newly inserted catalog rows across repeat syncs', () async {
    final client = MockClient(
      (_) async => http.Response(
        jsonEncode(
          page([
            exercise(id: 10, name: 'Unique exercise'),
            exercise(id: 11, name: 'Unique exercise'),
          ]),
        ),
        200,
      ),
    );

    expect(await ExerciseApiService.syncFromWger(db, client: client), (
      1,
      null,
    ));
    expect(await ExerciseApiService.syncFromWger(db, client: client), (
      0,
      null,
    ));
    expect((await db.select(db.exerciseCatalog).get()).length, 1);
  });

  test('skips records without an English language 2 translation', () async {
    final client = MockClient(
      (_) async => http.Response(
        jsonEncode(
          page([
            {
              'id': 20,
              'category': {'name': 'Arms'},
              'translations': [
                {'language': 1, 'name': 'Nur Deutsch'},
              ],
            },
          ]),
        ),
        200,
      ),
    );

    expect(await ExerciseApiService.syncFromWger(db, client: client), (
      0,
      null,
    ));
    expect(await db.select(db.exerciseCatalog).get(), isEmpty);
  });

  test(
    'network timeout leaves local catalog untouched and returns fallback',
    () async {
      await db
          .into(db.exerciseCatalog)
          .insert(
            ExerciseCatalogCompanion.insert(name: 'Local', category: 'Core'),
          );
      final client = MockClient(
        (_) => Future<http.Response>.delayed(const Duration(seconds: 1)),
      );

      final result = await ExerciseApiService.syncFromWger(
        db,
        client: client,
        timeout: const Duration(milliseconds: 1),
      );

      expect(result.$1, 0);
      expect(result.$2, contains('offline/timeout'));
      expect((await db.select(db.exerciseCatalog).get()).single.name, 'Local');
    },
  );

  test('failed later page rolls back all fetched catalog inserts', () async {
    final client = MockClient((request) async {
      if (request.url.path == '/') {
        return http.Response(
          jsonEncode(
            page([
              exercise(id: 30, name: 'Would roll back'),
            ], next: 'https://test.invalid/fail'),
          ),
          200,
        );
      }
      return http.Response('unavailable', 503);
    });

    final result = await ExerciseApiService.syncFromWger(db, client: client);

    expect(result.$1, 0);
    expect(result.$2, contains('HTTP 503'));
    expect(await db.select(db.exerciseCatalog).get(), isEmpty);
  });

  test(
    'records differing CC licenses and authors without blanket CC4 claims',
    () async {
      final client = MockClient(
        (_) async => http.Response(
          jsonEncode(
            page([
              exercise(
                id: 101,
                name: 'Arm Curl CC3',
                license: 1,
                author: 'flori',
              ),
              exercise(
                id: 102,
                name: 'Kettlebell Swing CC4',
                license: 2,
                author: 'deusinvictus',
              ),
              exercise(
                id: 103,
                name: 'Bodyweight Squat CC0',
                license: 3,
                author: 'community',
              ),
              exercise(
                id: 104,
                name: 'Plank CC-BY 4',
                license: 4,
                author: 'trainer_bob',
              ),
              exercise(id: 105, name: 'Stretch ODbL', license: 5, author: null),
            ]),
          ),
          200,
        ),
      );

      final result = await ExerciseApiService.syncFromWger(db, client: client);
      expect(result, (5, null));

      final rows = await db.select(db.exerciseCatalog).get();
      final cc3Row = rows.singleWhere((r) => r.externalId == 101);
      final cc4Row = rows.singleWhere((r) => r.externalId == 102);
      final cc0Row = rows.singleWhere((r) => r.externalId == 103);
      final ccByRow = rows.singleWhere((r) => r.externalId == 104);
      final odblRow = rows.singleWhere((r) => r.externalId == 105);

      expect(cc3Row.source, 'wger_api (license: CC-BY-SA 3, author: flori)');
      expect(
        cc4Row.source,
        'wger_api (license: CC-BY-SA 4, author: deusinvictus)',
      );
      expect(cc0Row.source, 'wger_api (license: CC0, author: community)');
      expect(
        ccByRow.source,
        'wger_api (license: CC-BY 4, author: trainer_bob)',
      );
      expect(odblRow.source, 'wger_api (license: ODbL)');
    },
  );

  test('reports database transaction errors honestly', () async {
    final client = MockClient(
      (_) async => http.Response(
        jsonEncode(page([exercise(id: 201, name: 'Valid Exercise')])),
        200,
      ),
    );

    // Close the DB executor to force a transaction failure
    await db.close();

    final result = await ExerciseApiService.syncFromWger(db, client: client);
    expect(result.$1, 0);
    expect(result.$2, contains('Gagal menyimpan transaksi database'));
  });

  test('parses real wger metadata structure with translations without fetching descriptions/images', () async {
    // Real structure returned by GET https://wger.de/api/v2/exerciseinfo/?limit=25
    final realMetadataPayload = {
      'count': 932,
      'next': null,
      'results': [
        {
          'id': 9,
          'category': {'id': 10, 'name': 'Abs'},
          'translations': [
            {
              'id': 345,
              'language': 2,
              'name': '2 Handed Kettlebell Swing',
              'license': 2,
              'license_author': 'deusinvictus',
            },
            {
              'id': 5253,
              'language': 7,
              'name': 'Swing com kettlebell',
              'license': 2,
              'license_author': 'jptjptjptjpt',
            },
            {
              'id': 5230,
              'language': 15,
              'name': 'Махи гирею двома руками',
              'license': 2,
              'license_author': 'aom44ja6w@mozmail.com',
            },
          ],
        },
        {
          'id': 12,
          'category': {'id': 9, 'name': 'Legs'},
          'translations': [
            {
              'id': 4829,
              'language': 12,
              'name': 'Adduction de hanche assise',
              'license': 2,
              'license_author': 'wger.de',
            },
            {
              'id': 174,
              'language': 1,
              'name': 'Adduktoren-Maschine',
              'license': 1,
              'license_author': 'flori',
            },
            {
              'id': 377,
              'language': 2,
              'name': 'Seated Hip Adduction',
              'license': 1,
              'license_author': 'flori',
            },
          ],
        },
      ],
    };

    final client = MockClient((req) async {
      return http.Response.bytes(
        utf8.encode(jsonEncode(realMetadataPayload)),
        200,
        headers: {'content-type': 'application/json; charset=utf-8'},
      );
    });
    final (count, error) = await ExerciseApiService.syncFromWger(
      db,
      client: client,
    );

    expect(count, 2);
    expect(error, isNull);

    final rows = await db.select(db.exerciseCatalog).get();
    final kettlebell = rows.singleWhere(
      (r) => r.name == '2 Handed Kettlebell Swing',
    );
    expect(kettlebell.category, 'Abs');
    expect(
      kettlebell.source,
      'wger_api (license: CC-BY-SA 4, author: deusinvictus)',
    );

    final adduction = rows.singleWhere((r) => r.name == 'Seated Hip Adduction');
    expect(adduction.category, 'Legs');
    expect(adduction.source, 'wger_api (license: CC-BY-SA 3, author: flori)');
  });

  test('live wger API probe verifies real GET metadata without descriptions/images', () async {
    final client = http.Client();
    try {
      final (count, error) = await ExerciseApiService.syncFromWger(
        db,
        client: client,
        maxPages: 1,
      );
      // If network is available in this environment, it syncs real items.
      // If blocked/offline, it falls back gracefully with count 0 and error string.
      if (error == null) {
        expect(count, greaterThan(0));
        final rows = await db.select(db.exerciseCatalog).get();
        expect(rows, isNotEmpty);
        // Verify real metadata mapped properly
        for (final row in rows) {
          expect(row.source, startsWith('wger_api'));
          expect(row.name, isNotEmpty);
          expect(row.category, isNotEmpty);
        }
      } else {
        expect(error, contains('offline/timeout'));
      }
    } finally {
      client.close();
    }
  });
}
