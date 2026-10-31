import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbois_gym_pt/cloud/cloud_pilot.dart';

import 'cloud_checkpoint_test.dart' show FakeGateway;

void main() {
  testWidgets('pilot has controlled login and no operational write actions', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(home: CloudPilot(gateway: FakeGateway())),
    );
    expect(find.text('Masuk Firebase'), findsOneWidget);
    expect(find.textContaining('Hanya baca'), findsOneWidget);
    expect(find.text('Daftar'), findsNothing);
    expect(find.text('Selesaikan sesi'), findsNothing);
    await tester.tap(find.text('Kirim reset password'));
    await tester.pump();
    expect(find.textContaining('Masukkan email valid'), findsOneWidget);
  });
}
