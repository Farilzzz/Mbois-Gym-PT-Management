import 'package:flutter_test/flutter_test.dart';
import 'package:mbois_gym_pt/data/app_database.dart';

void main() {
  test('drop set menghitung setiap tahap tepat satu kali', () {
    final exercise = ExerciseDraft(
      name: 'Bench Press',
      method: 'Drop Set',
      sets: [
        const SetDraft(10, 40, stage: 1),
        const SetDraft(8, 30, stage: 2),
        const SetDraft(6, 20, stage: 3),
      ],
    );
    expect(trainingVolume([exercise]), 760);
  });

  test('superset menjumlahkan volume exercise A dan B tanpa duplikasi', () {
    final exercises = [
      ExerciseDraft(
        name: 'Bench',
        method: 'Superset',
        groupKey: 'A',
        sets: [const SetDraft(10, 40)],
      ),
      ExerciseDraft(
        name: 'Row',
        method: 'Superset',
        groupKey: 'A',
        sets: [const SetDraft(10, 30)],
      ),
    ];
    expect(trainingVolume(exercises), 700);
  });

  test(
    'bodyweight tanpa beban terukur tidak menghasilkan angka volume fiktif',
    () {
      final exercise = ExerciseDraft(
        name: 'Plank',
        method: 'Straight Set',
        sets: [const SetDraft(1, null)],
      );
      expect(exercise.sets.single.volume, isNull);
      expect(trainingVolume([exercise]), 0);
    },
  );
}
