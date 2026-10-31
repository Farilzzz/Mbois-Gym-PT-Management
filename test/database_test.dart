import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbois_gym_pt/data/app_database.dart';

void main() {
  late AppDatabase db;
  late int trainer;
  Future<int> client({
    int age = 25,
    int count = 8,
    double? weight,
    double? height,
  }) => db.addClient(
    trainerId: trainer,
    name: 'Client',
    age: age,
    sessionsCount: count,
    weight: weight,
    height: height,
  );
  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    trainer = await db
        .into(db.trainers)
        .insert(
          TrainersCompanion.insert(
            name: 'PT',
            email: 'pt@test.local',
            passwordSalt: 'salt',
            passwordHash: 'hash',
          ),
        );
  });
  tearDown(() => db.close());

  test('client validation rejects invalid age packages and measurements atomically', () async {
    for (final age in [0, -1]) {
      await expectLater(client(age: age), throwsArgumentError);
    }
    for (final count in [0, 7, 9, 20]) {
      await expectLater(client(count: count), throwsArgumentError);
    }
    for (final value in [0.0, -1.0, double.infinity, double.nan]) {
      await expectLater(client(weight: value), throwsArgumentError);
      await expectLater(client(height: value), throwsArgumentError);
    }
    expect(await db.select(db.clients).get(), isEmpty);
    expect(await db.select(db.ptPackages).get(), isEmpty);
    for (final count in [8, 12, 16]) {
      final id = await client(count: count, weight: 70, height: 175);
      expect((await db.currentPackage(id))!.totalSessions, count);
    }
  });

  test(
    'foreign key enforcement rejects orphan records on all connections',
    () async {
      await expectLater(
        db
            .into(db.clients)
            .insert(
              ClientsCompanion.insert(
                trainerId: 9999,
                name: 'Ghost Client',
                age: 25,
              ),
            ),
        throwsA(anything),
      );
    },
  );

  test(
    'workout rejects package and session that do not belong to its client',
    () async {
      final first = await client();
      final second = await client();
      final firstPackage = (await db.currentPackage(first))!.id;
      final secondPackage = (await db.currentPackage(second))!.id;
      final session = await db.schedule(firstPackage, DateTime(2026));
      final exercises = [
        ExerciseDraft(
          name: 'Squat',
          method: 'Straight Set',
          sets: [const SetDraft(8, 40)],
        ),
      ];
      await expectLater(
        db.saveWorkout(
          clientId: first,
          packageId: secondPackage,
          notes: '',
          exercises: exercises,
        ),
        throwsStateError,
      );
      await expectLater(
        db.saveWorkout(
          clientId: first,
          packageId: firstPackage,
          sessionId: await db.schedule(secondPackage, DateTime(2026)),
          notes: '',
          exercises: exercises,
        ),
        throwsStateError,
      );
      await expectLater(
        db.saveWorkout(
          clientId: second,
          packageId: secondPackage,
          sessionId: session,
          notes: '',
          exercises: exercises,
        ),
        throwsStateError,
      );
    },
  );

  test(
    'workout rejects empty and non-finite weights without partial logs',
    () async {
      final clientId = await client();
      final packageId = (await db.currentPackage(clientId))!.id;
      await expectLater(
        db.saveWorkout(
          clientId: clientId,
          packageId: packageId,
          notes: '',
          exercises: [],
        ),
        throwsStateError,
      );
      for (final weight in [
        double.nan,
        double.infinity,
        double.negativeInfinity,
      ]) {
        await expectLater(
          db.saveWorkout(
            clientId: clientId,
            packageId: packageId,
            notes: '',
            exercises: [
              ExerciseDraft(
                name: 'Squat',
                method: 'Straight Set',
                sets: [SetDraft(8, weight)],
              ),
            ],
          ),
          throwsStateError,
        );
      }
      expect(await db.logsForClient(clientId), isEmpty);
    },
  );

  test('cancelled sessions release capacity and scheduled sessions can be rescheduled', () async {
    final clientId = await client(count: 8);
    final packageId = (await db.currentPackage(clientId))!.id;
    final slots = <int>[];
    for (var i = 0; i < 8; i++) {
      slots.add(await db.schedule(packageId, DateTime(2026, 1, i + 1)));
    }
    await expectLater(
      db.schedule(packageId, DateTime(2026, 2)),
      throwsStateError,
    );
    await db.cancelSession(slots.first);
    final replacement = await db.schedule(packageId, DateTime(2026, 2));
    expect(replacement, isNot(slots.first));
    await db.rescheduleSession(replacement, DateTime(2026, 3));
    expect(
      (await db.packageSessions(packageId))
          .singleWhere((s) => s.id == replacement)
          .scheduledAt,
      DateTime(2026, 3),
    );
  });

  test(
    'renewal creates only an allowed package after the current package closes',
    () async {
      final clientId = await client();
      final active = (await db.currentPackage(clientId))!;
      await expectLater(db.renewPackage(clientId, 12), throwsStateError);
      await (db.update(db.ptPackages)..where((p) => p.id.equals(active.id)))
          .write(const PtPackagesCompanion(status: Value('closed')));
      await expectLater(db.renewPackage(clientId, 10), throwsArgumentError);
      final renewed = await db.renewPackage(clientId, 12);
      expect(renewed.totalSessions, 12);
    },
  );

  test('closed packages reject rescheduling and cancellation', () async {
    final id = await client();
    final pkg = (await db.currentPackage(id))!;
    final session = await db.schedule(pkg.id, DateTime(2026));
    await (db.update(db.ptPackages)..where((p) => p.id.equals(pkg.id))).write(
      const PtPackagesCompanion(status: Value('closed')),
    );
    await expectLater(
      db.rescheduleSession(session, DateTime(2027)),
      throwsStateError,
    );
    await expectLater(db.cancelSession(session), throwsStateError);
  });

  for (final count in [8, 12, 16]) {
    test(
      '$count session package completion is idempotent and closes with evaluation',
      () async {
        final id = await client(count: count);
        final pkg = (await db.currentPackage(id))!;
        final evaluation = PostPtEvaluationsCompanion.insert(
          packageId: pkg.id,
          achievement: 'A',
          evaluation: 'E',
          recommendation: 'R',
          conclusion: 'C',
        );
        await expectLater(
          db.finalizePackage(pkg.id, evaluation),
          throwsStateError,
        );
        for (var i = 0; i < count; i++) {
          final session = await db.schedule(pkg.id, DateTime(2026, 1, i + 1));
          expect(await db.completeSession(session, 'done'), isTrue);
          expect(await db.completeSession(session, 'retry'), isFalse);
          await expectLater(db.cancelSession(session), throwsStateError);
          await expectLater(
            db.rescheduleSession(session, DateTime(2027)),
            throwsStateError,
          );
        }
        expect(await db.completedCount(pkg.id), count);
        await expectLater(
          db.schedule(pkg.id, DateTime(2027)),
          throwsStateError,
        );
        await expectLater(
          db.finalizePackage(
            pkg.id,
            evaluation.copyWith(finalWeightKg: const Value(double.infinity)),
          ),
          throwsArgumentError,
        );
        await db.finalizePackage(pkg.id, evaluation);
        expect((await db.currentPackage(id))!.status, 'closed');
        await expectLater(
          db.finalizePackage(pkg.id, evaluation),
          throwsStateError,
        );
        expect(await db.select(db.postPtEvaluations).get(), hasLength(1));
        final renewed = await db.renewPackage(id, count);
        expect(renewed.id, isNot(pkg.id));
        expect(await db.completedCount(renewed.id), 0);
      },
    );
  }

  test('finalization rejects an evaluation for another package', () async {
    final first = await client();
    final second = await client();
    final firstPackage = (await db.currentPackage(first))!.id;
    final secondPackage = (await db.currentPackage(second))!.id;
    for (var i = 0; i < 8; i++) {
      final id = await db.schedule(firstPackage, DateTime(2026, 1, i + 1));
      await db.completeSession(id, 'done');
    }
    final evaluation = PostPtEvaluationsCompanion.insert(
      packageId: secondPackage,
      achievement: 'A',
      evaluation: 'E',
      recommendation: 'R',
      conclusion: 'C',
    );
    await expectLater(
      db.finalizePackage(firstPackage, evaluation),
      throwsArgumentError,
    );
  });
}
