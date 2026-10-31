import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbois_gym_pt/app.dart';
import 'package:mbois_gym_pt/data/app_database.dart';
import 'package:mbois_gym_pt/features/screens.dart';

class _LoggedInAuth extends AuthController {
  final int id;
  _LoggedInAuth(this.id);
  @override
  Future<int?> build() async => id;
}

void main() {
  late AppDatabase db;
  late int trainerId;
  late int clientId;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    trainerId = await db
        .into(db.trainers)
        .insert(
          TrainersCompanion.insert(
            name: 'Coach Ahmad Faril',
            email: 'coach.faril@mboisgym.com',
            passwordSalt: 'salt',
            passwordHash: 'hash',
            phone: const Value('+6281234567890'),
          ),
        );
    clientId = await db.addClient(
      trainerId: trainerId,
      name: 'Ahmad Member',
      age: 26,
      sessionsCount: 12,
    );
  });

  tearDown(() async {
    await db.close();
  });

  Widget buildTestApp(Widget child) {
    return ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(db),
        authProvider.overrideWith(() => _LoggedInAuth(trainerId)),
      ],
      child: MaterialApp(home: child),
    );
  }

  testWidgets('ProfileScreen menampilkan data lengkap Coach dari SQLite', (
    tester,
  ) async {
    await tester.pumpWidget(buildTestApp(const ProfileScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Profil & Pengaturan Coach'), findsOneWidget);
    expect(find.text('Coach Ahmad Faril'), findsOneWidget);
    expect(find.text('coach.faril@mboisgym.com'), findsOneWidget);
    expect(find.text('+6281234567890'), findsOneWidget);
    expect(find.text('EDIT PROFIL'), findsOneWidget);

    // Scroll to see logout button
    await tester.scrollUntilVisible(find.text('LOGOUT COACH'), 300);
    expect(find.text('LOGOUT COACH'), findsOneWidget);
  });

  testWidgets(
    'WorkoutEditorScreen mode Create menampilkan form dan empty state',
    (tester) async {
      await tester.pumpWidget(
        buildTestApp(WorkoutEditorScreen(clientId: clientId)),
      );
      await tester.pumpAndSettle();

      expect(find.text('Pencatatan Latihan'), findsOneWidget);
      expect(find.text('Total Training Volume:'), findsOneWidget);
      expect(find.text('Belum ada exercise yang ditambahkan.'), findsOneWidget);
      expect(find.text('Tambah'), findsOneWidget);
      expect(find.text('SIMPAN SESI LATIHAN'), findsOneWidget);
    },
  );
}
