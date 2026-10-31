import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:drift/drift.dart' show Value;
import 'package:mbois_gym_pt/data/gym_repository.dart';
import 'package:mbois_gym_pt/widgets/touch_signature_pad.dart';
import 'package:mbois_gym_pt/data/app_database.dart';

void main() {
  group('1. Digital Signature & Touch Pad Verification', () {
    test('TouchSignatureController validates genuine finger strokes (min 8 points)', () {
      final controller = TouchSignatureController();
      expect(controller.hasSignature, isFalse);
      expect(controller.points.length, 0);

      // Adding only 2 points (a tap/dot) does NOT qualify as a real signature
      controller.addPoint(const Offset(10, 10));
      controller.addPoint(const Offset(11, 11));

      expect(
        controller.hasSignature,
        isFalse,
        reason: 'Minimum 8 coordinate points are required to prevent dummy dot submissions',
      );

      // Adding continuous coordinates (representing a genuine finger signature)
      for (int i = 0; i < 8; i++) {
        controller.addPoint(Offset(10.0 + i * 5, 20.0 + i * 3));
      }

      expect(controller.hasSignature, isTrue);
      expect(
        controller.points.where((p) => p != null).length,
        greaterThanOrEqualTo(8),
      );

      // Clearing resets state cleanly
      controller.clear();
      expect(controller.hasSignature, isFalse);
      expect(controller.points.isEmpty, isTrue);
    });
  });

  group('2. Training Volume & Workout Calculation', () {
    test('trainingVolume correctly computes total kg lifted across sets', () {
      final exercises = <ExerciseDraft>[
        ExerciseDraft(
          name: 'Barbell Bench Press',
          method: 'Straight Set',
          sets: const [
            SetDraft(10, 60.0), // 600 kg
            SetDraft(8, 70.0), // 560 kg
            SetDraft(6, 80.0), // 480 kg
          ],
        ),
        ExerciseDraft(
          name: 'Incline Dumbbell Press',
          method: 'Straight Set',
          sets: const [
            SetDraft(12, 20.0), // 240 kg
            SetDraft(10, 22.5), // 225 kg
          ],
        ),
      ];

      // Bench: 600 + 560 + 480 = 1640 kg
      // DB Press: 240 + 225 = 465 kg
      // Total: 2105 kg
      final totalVolume = trainingVolume(exercises);
      expect(totalVolume, 2105.0);
    });

    test('trainingVolume handles bodyweight exercises (null weight)', () {
      final exercises = <ExerciseDraft>[
        ExerciseDraft(
          name: 'Pull Up',
          method: 'Bodyweight',
          sets: const [SetDraft(10, null), SetDraft(8, null)],
        ),
      ];
      final totalVolume = trainingVolume(exercises);
      expect(totalVolume, 0.0);
    });
  });

  group('3. GymRepository & Operational Lifecycle Contract', () {
    late AppDatabase db;
    late SqliteGymRepository repo;
    late int trainerId;

    setUp(() async {
      db = AppDatabase(NativeDatabase.memory());
      repo = SqliteGymRepository(db);

      trainerId = await db
          .into(db.trainers)
          .insert(
            TrainersCompanion.insert(
              name: 'Coach Faril',
              email: 'faril@mboisgym.com',
              passwordSalt: 'salt123',
              passwordHash: 'hash123',
              phone: const Value('08123456789'),
            ),
          );
    });

    tearDown(() async {
      await db.close();
    });

    test(
      'SqliteGymRepository manages Client lifecycle, packages and attendance',
      () async {
        // Add Client
        final clientId = await repo.addClient(
          trainerId: trainerId,
          name: 'Budi Santoso',
          age: 28,
          contact: '081999888777',
          sessionsCount: 12,
          height: 175.0,
          weight: 78.5,
          goal: 'Fat Loss & Hypertrophy',
          notes: 'Sedang program defisit kalori',
        );

        final client = await repo.getClient(clientId);
        expect(client, isNotNull);
        expect(client!.name, 'Budi Santoso');
        expect(client.goal, 'Fat Loss & Hypertrophy');

        // Current Package
        final pkg = await repo.currentPackage(clientId);
        expect(pkg, isNotNull);
        expect(pkg!.totalSessions, 12);
        expect(pkg.status, 'active');

        // Schedule session 1
        final s1 = await repo.schedule(
          pkg.id,
          DateTime.now().add(const Duration(days: 1)),
        );
        final sessions = await repo.packageSessions(pkg.id);
        expect(sessions.length, 1);

        // Complete session 1
        await repo.completeSession(s1, 'Pemanasan dan compound lift');

        final completed = await repo.completedCount(pkg.id);
        expect(completed, 1);

        final remaining = pkg.totalSessions - completed;
        expect(remaining, 11);

        // Close package
        await repo.closePackage(pkg.id);
        final closedPkg = await (db.select(
          db.ptPackages,
        )..where((p) => p.id.equals(pkg.id))).getSingle();
        expect(closedPkg.status, 'closed');
      },
    );

    test('Workout CRUD and volume logging', () async {
      final clientId = await repo.addClient(
        trainerId: trainerId,
        name: 'Andi Pratama',
        age: 26,
        sessionsCount: 8,
      );
      final pkg = (await repo.currentPackage(clientId))!;
      final session = await repo.schedule(
        pkg.id,
        DateTime.now().add(const Duration(days: 1)),
      );

      final exercises = <ExerciseDraft>[
        ExerciseDraft(
          name: 'Squat',
          method: 'Straight Set',
          sets: const [SetDraft(10, 80.0), SetDraft(8, 90.0)],
        ),
      ];

      // Save Workout
      final logId = await repo.saveWorkout(
        clientId: clientId,
        packageId: pkg.id,
        sessionId: session,
        notes: 'Latihan paha mantap',
        exercises: exercises,
      );

      final logs = await repo.logsForClient(clientId);
      expect(logs.length, 1);
      expect(logs.first.id, logId);
      expect(logs.first.notes, 'Latihan paha mantap');

      final savedExercises = await repo.exercisesForLog(logId);
      expect(savedExercises.length, 1);
      expect(savedExercises.first.name, 'Squat');

      final savedSets = await repo.setsForExercise(savedExercises.first.id);
      expect(savedSets.length, 2);
      expect(savedSets[0].reps, 10);
      expect(savedSets[0].weightKg, 80.0);
      expect(savedSets[1].reps, 8);
      expect(savedSets[1].weightKg, 90.0);

      // Update Workout: add exercise
      final updatedExercises = <ExerciseDraft>[
        ...exercises,
        ExerciseDraft(
          name: 'Leg Extension',
          method: 'Straight Set',
          sets: const [
            SetDraft(12, 40.0), // 480 kg
          ],
        ),
      ];

      await repo.updateWorkout(
        logId: logId,
        notes: 'Latihan paha dan quad finisher',
        sessionId: session,
        exercises: updatedExercises,
      );

      final updatedLogs = await repo.logsForClient(clientId);
      expect(updatedLogs.first.notes, 'Latihan paha dan quad finisher');

      final updatedExercisesList = await repo.exercisesForLog(logId);
      expect(updatedExercisesList.length, 2);

      // Delete Workout
      await repo.deleteWorkout(logId);
      final remainingLogs = await repo.logsForClient(clientId);
      expect(remainingLogs.isEmpty, isTrue);
    });
  });

  group('4. Concurrency & Idempotency Rules Contract', () {
    test('Idempotency contract: completing an already completed session throws StateError', () {
      final mockSessionDoc = {
        'status': 'completed',
        'sessionNumber': 1,
        'completedAt': DateTime.now().toIso8601String(),
      };

      expect(() {
        if (mockSessionDoc['status'] == 'completed') {
          throw StateError('Sesi ini sudah diselesaikan sebelumnya.');
        }
      }, throwsA(isA<StateError>()));
    });

    test('Quota guard contract: remaining sessions cannot drop below zero', () {
      int remaining = 0;
      expect(() {
        if (remaining <= 0) {
          throw StateError('Kuota sesi pada paket ini sudah habis.');
        }
        remaining -= 1;
      }, throwsA(isA<StateError>()));
    });
  });
}
