import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbois_gym_pt/data/app_database.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  Future<int> createTrainer({
    String name = 'Coach Faril',
    String email = 'coach.faril@mboisgym.com',
    String phone = '08123456789',
  }) async {
    return db
        .into(db.trainers)
        .insert(
          TrainersCompanion.insert(
            name: name,
            email: email,
            passwordSalt: 'salt123',
            passwordHash: 'hash123',
            phone: Value(phone),
          ),
        );
  }

  Future<int> createClient(int trainerId, {String name = 'Ahmad'}) async {
    return db.addClient(
      trainerId: trainerId,
      name: name,
      age: 25,
      sessionsCount: 12,
    );
  }

  group('Revisi Profil PT & WhatsApp Persistence', () {
    test('normalisasi dan validasi nomor WhatsApp', () {
      expect(normalizePhoneNumber('  0812-3456-7890  '), '081234567890');
      expect(normalizePhoneNumber('+62 812 3456 7890'), '+6281234567890');
      expect(normalizePhoneNumber('(021) 555-1234'), '0215551234');

      expect(isValidPhoneNumber('081234567890'), isTrue);
      expect(isValidPhoneNumber('+6281234567890'), isTrue);
      expect(isValidPhoneNumber('123'), isFalse); // too short
      expect(isValidPhoneNumber('abc'), isFalse);
    });

    test('edit profil PT berhasil dan tersimpan secara persisten', () async {
      final trainerId = await createTrainer(
        name: 'Coach Faril',
        email: 'coach.faril@mboisgym.com',
        phone: '08123456789',
      );

      // Edit profil
      await db.updateTrainer(
        id: trainerId,
        name: 'Coach Faril Albi',
        email: 'coach.albi@mboisgym.com',
        phone: '+62 812 9999 8888',
        avatarUrl: 'https://example.com/avatar.jpg',
      );

      final updated = await db.getTrainerById(trainerId);
      expect(updated, isNotNull);
      expect(updated!.name, 'Coach Faril Albi');
      expect(updated.email, 'coach.albi@mboisgym.com');
      expect(updated.phone, '+6281299998888'); // normalized
      expect(updated.avatarUrl, 'https://example.com/avatar.jpg');
    });

    test(
      'validasi profil PT menolak nama kosong dan format email salah',
      () async {
        final trainerId = await createTrainer();

        await expectLater(
          db.updateTrainer(id: trainerId, name: '   ', email: 'valid@gym.com'),
          throwsA(isA<ArgumentError>()),
        );

        await expectLater(
          db.updateTrainer(
            id: trainerId,
            name: 'Coach',
            email: 'invalid-email-format',
          ),
          throwsA(isA<ArgumentError>()),
        );
      },
    );

    test('validasi profil PT menolak duplikasi email antar akun PT', () async {
      final t1 = await createTrainer(name: 'Trainer 1', email: 'pt1@gym.com');
      await createTrainer(name: 'Trainer 2', email: 'pt2@gym.com');

      await expectLater(
        db.updateTrainer(
          id: t1,
          name: 'Trainer 1 Edit',
          email: 'pt2@gym.com', // duplicate
        ),
        throwsA(isA<StateError>()),
      );
    });
  });

  group('Revisi CRUD Log Workout & Kasus Wajib', () {
    test('CONTOH KASUS WAJIB: PT menyimpan workout awal Bench Press 3x10x40kg sesi 5, lalu edit menambahkan Lat Pulldown 3x12x35kg tanpa duplikasi', () async {
      final trainerId = await createTrainer();
      final clientId = await createClient(trainerId, name: 'Ahmad');
      final pkg = (await db.currentPackage(clientId))!;

      // Jadwalkan sesi 1..5
      for (var i = 1; i < 5; i++) {
        await db.schedule(pkg.id, DateTime(2026, 10, i));
      }
      final session5Id = await db.schedule(
        pkg.id,
        DateTime(2026, 10, 25, 9, 0),
      );

      // 1. Simpan workout awal: Bench Press, 3 x 10 x 40 kg pada 25 Oktober 2026
      final initialExercises = [
        ExerciseDraft(
          name: 'Bench Press',
          method: 'Straight Set',
          sets: [
            const SetDraft(10, 40),
            const SetDraft(10, 40),
            const SetDraft(10, 40),
          ],
        ),
      ];

      final logId = await db.saveWorkout(
        clientId: clientId,
        packageId: pkg.id,
        sessionId: session5Id,
        notes: 'Upper Push Sesi 5',
        exercises: initialExercises,
      );

      // Verifikasi log awal tersimpan
      var logs = await db.logsForClient(clientId);
      expect(logs.length, 1);
      expect(logs.first.id, logId);
      expect(logs.first.sessionId, session5Id);

      var exercisesInDb = await db.exercisesForLog(logId);
      expect(exercisesInDb.length, 1);
      expect(exercisesInDb.first.name, 'Bench Press');

      // Hitung volume awal: 3 * (10 * 40) = 1200 kg
      final initialSets = await db.setsForExercise(exercisesInDb.first.id);
      expect(initialSets.length, 3);
      final initialVolume = initialSets.fold<double>(
        0,
        (sum, s) => sum + (s.reps * (s.weightKg ?? 0)),
      );
      expect(initialVolume, 1200.0);

      // 2. PT membuka Edit Workout dan menambahkan Lat Pulldown: 3 x 12 x 35 kg
      // Membaca draft dengan ID yang sudah ada untuk update in-place
      final draftForEdit = [
        ExerciseDraft(
          id: exercisesInDb.first.id,
          name: exercisesInDb.first.name,
          method: exercisesInDb.first.method,
          sets: initialSets
              .map(
                (s) => SetDraft(s.reps, s.weightKg, stage: s.stage, id: s.id),
              )
              .toList(),
        ),
        ExerciseDraft(
          name: 'Lat Pulldown', // New exercise (id null)
          method: 'Straight Set',
          sets: [
            const SetDraft(12, 35),
            const SetDraft(12, 35),
            const SetDraft(12, 35),
          ],
        ),
      ];

      // 3. Tekan "Simpan Perubahan"
      await db.updateWorkout(
        logId: logId,
        sessionId: session5Id,
        notes: 'Upper Push & Pull Sesi 5 (Updated)',
        exercises: draftForEdit,
      );

      // 4. Verifikasi: TIDAK BOLEH MUNCUL WORKOUT DUPLIKAT
      logs = await db.logsForClient(clientId);
      expect(logs.length, 1, reason: 'Tidak boleh ada duplikasi workout log');
      expect(logs.first.id, logId, reason: 'ID workout log harus sama persis');
      expect(logs.first.clientId, clientId);
      expect(logs.first.sessionId, session5Id);
      expect(logs.first.notes, 'Upper Push & Pull Sesi 5 (Updated)');

      // Kedua exercise harus tersimpan di workout yang sama
      exercisesInDb = await db.exercisesForLog(logId);
      expect(exercisesInDb.length, 2);
      expect(
        exercisesInDb.map((e) => e.name),
        containsAll(['Bench Press', 'Lat Pulldown']),
      );

      // Recalculate Training Volume:
      // Bench Press: 3 * 10 * 40 = 1200 kg
      // Lat Pulldown: 3 * 12 * 35 = 1260 kg
      // Total = 2460 kg
      double updatedTotalVolume = 0;
      for (final ex in exercisesInDb) {
        final sList = await db.setsForExercise(ex.id);
        for (final s in sList) {
          if (s.weightKg != null) {
            updatedTotalVolume += (s.reps * s.weightKg!);
          }
        }
      }
      expect(updatedTotalVolume, 2460.0);
    });

    test('edit repetisi dan beban pada set yang sudah tersimpan', () async {
      final trainerId = await createTrainer();
      final clientId = await createClient(trainerId);
      final pkg = (await db.currentPackage(clientId))!;

      final logId = await db.saveWorkout(
        clientId: clientId,
        packageId: pkg.id,
        notes: 'Test edit set',
        exercises: [
          ExerciseDraft(
            name: 'Shoulder Press',
            method: 'Straight Set',
            sets: [const SetDraft(10, 20), const SetDraft(10, 20)],
          ),
        ],
      );

      final exercises = await db.exercisesForLog(logId);
      final sets = await db.setsForExercise(exercises.first.id);

      // Edit set 1: 10 reps x 20 kg -> 12 reps x 25 kg
      final updatedDraft = [
        ExerciseDraft(
          id: exercises.first.id,
          name: exercises.first.name,
          method: exercises.first.method,
          sets: [
            SetDraft(12, 25, stage: 1, id: sets[0].id),
            SetDraft(10, 20, stage: 2, id: sets[1].id),
          ],
        ),
      ];

      await db.updateWorkout(
        logId: logId,
        notes: 'Test edit set updated',
        exercises: updatedDraft,
      );

      final updatedSets = await db.setsForExercise(exercises.first.id);
      expect(updatedSets[0].reps, 12);
      expect(updatedSets[0].weightKg, 25.0);
      expect(updatedSets[1].reps, 10);
      expect(updatedSets[1].weightKg, 20.0);

      // Volume baru: (12*25) + (10*20) = 300 + 200 = 500 kg
      final vol = updatedSets.fold<double>(
        0,
        (sum, s) => sum + (s.reps * (s.weightKg ?? 0)),
      );
      expect(vol, 500.0);
    });

    test('hapus satu exercise tanpa menghapus workout log', () async {
      final trainerId = await createTrainer();
      final clientId = await createClient(trainerId);
      final pkg = (await db.currentPackage(clientId))!;

      final logId = await db.saveWorkout(
        clientId: clientId,
        packageId: pkg.id,
        notes: 'Multi-exercise workout',
        exercises: [
          ExerciseDraft(
            name: 'Incline Bench Press',
            method: 'Straight Set',
            sets: [const SetDraft(10, 30)],
          ),
          ExerciseDraft(
            name: 'Cable Fly',
            method: 'Straight Set',
            sets: [const SetDraft(15, 12.5)],
          ),
        ],
      );

      final exercises = await db.exercisesForLog(logId);
      expect(exercises.length, 2);

      // Hapus exercise kedua (Cable Fly) secara spesifik
      final deleted = await db.deleteWorkoutExercise(exercises[1].id);
      expect(deleted, isTrue);

      // Workout log tetap ADA dan tidak terhapus
      final log = await db.getWorkoutLog(logId);
      expect(log, isNotNull);

      // Sisa 1 exercise (Incline Bench Press)
      final remainingExercises = await db.exercisesForLog(logId);
      expect(remainingExercises.length, 1);
      expect(remainingExercises.first.name, 'Incline Bench Press');
    });

    test(
      'hapus seluruh workout log menghapus exercise dan sets terkait',
      () async {
        final trainerId = await createTrainer();
        final clientId = await createClient(trainerId);
        final pkg = (await db.currentPackage(clientId))!;

        final logId = await db.saveWorkout(
          clientId: clientId,
          packageId: pkg.id,
          notes: 'To be deleted',
          exercises: [
            ExerciseDraft(
              name: 'Deadlift',
              method: 'Straight Set',
              sets: [const SetDraft(5, 100)],
            ),
          ],
        );

        final exercises = await db.exercisesForLog(logId);
        final exId = exercises.first.id;

        // Hapus seluruh workout
        final deleted = await db.deleteWorkout(logId);
        expect(deleted, isTrue);

        // Workout log sudah tidak ada
        final log = await db.getWorkoutLog(logId);
        expect(log, isNull);

        // Child exercises dan sets juga bersih
        final remainingExercises = await db.exercisesForLog(logId);
        expect(remainingExercises.isEmpty, isTrue);

        final remainingSets = await db.setsForExercise(exId);
        expect(remainingSets.isEmpty, isTrue);
      },
    );

    test('recalculate volume untuk Drop Set dan Superset', () {
      // Normal Set
      final normal = ExerciseDraft(
        name: 'Squat',
        method: 'Straight Set',
        sets: [const SetDraft(10, 50), const SetDraft(10, 50)],
      );
      expect(normal.volume, 1000.0);

      // Drop Set: tahap 1 (8 x 60) + tahap 2 (8 x 40) + tahap 3 (10 x 20)
      final dropSet = ExerciseDraft(
        name: 'Leg Press',
        method: 'Drop Set',
        sets: [
          const SetDraft(8, 60, stage: 1),
          const SetDraft(8, 40, stage: 2),
          const SetDraft(10, 20, stage: 3),
        ],
      );
      // 480 + 320 + 200 = 1000 kg
      expect(dropSet.volume, 1000.0);

      // Superset pair
      final superA = ExerciseDraft(
        name: 'Bicep Curl',
        method: 'Superset',
        groupKey: 'Super-1',
        sets: [const SetDraft(12, 12)],
      );
      final superB = ExerciseDraft(
        name: 'Tricep Pushdown',
        method: 'Superset',
        groupKey: 'Super-1',
        sets: [const SetDraft(12, 15)],
      );
      // (12*12) + (12*15) = 144 + 180 = 324 kg
      final totalSuperVol = trainingVolume([superA, superB]);
      expect(totalSuperVol, 324.0);
    });
  });
}
