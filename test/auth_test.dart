import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbois_gym_pt/app.dart';
import 'package:mbois_gym_pt/data/app_database.dart';
import 'package:drift/native.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignedOutAuth extends AuthController {
  @override
  Future<int?> build() async => null;
}

class MemoryAuthStorage implements AuthStorage {
  MemoryAuthStorage([this.value]);
  String? value;
  Object? readError;
  Object? writeError;

  @override
  Future<String?> readTrainerId() async {
    if (readError != null) throw readError!;
    return value;
  }

  @override
  Future<void> writeTrainerId(String value) async {
    if (writeError != null) throw writeError!;
    this.value = value;
  }

  @override
  Future<void> deleteTrainerId() async => value = null;
}

Future<AppDatabase> memoryDatabase() async {
  final db = AppDatabase(NativeDatabase.memory());
  await db.customSelect('SELECT 1').get();
  return db;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    FlutterSecureStorage.setMockInitialValues({});
  });

  testWidgets('theme change preserves router instance and current route', (
    tester,
  ) async {
    final container = ProviderContainer(
      overrides: [authProvider.overrideWith(SignedOutAuth.new)],
    );
    addTearDown(container.dispose);
    await container.read(authProvider.future);
    await container.read(themeProvider.future);
    await tester.pumpWidget(
      UncontrolledProviderScope(container: container, child: const MboisApp()),
    );
    await tester.pumpAndSettle();
    final before = tester
        .widget<MaterialApp>(find.byType(MaterialApp))
        .routerConfig;
    await container.read(themeProvider.notifier).setMode(ThemeMode.dark);
    await tester.pumpAndSettle();
    expect(
      tester.widget<MaterialApp>(find.byType(MaterialApp)).routerConfig,
      same(before),
    );
  });

  test('build catches storage errors and yields null state', () async {
    final storage = MemoryAuthStorage()
      ..readError = StateError('Secure storage failure');
    final db = await memoryDatabase();
    final container = ProviderContainer(
      overrides: [
        databaseProvider.overrideWithValue(db),
        authStorageProvider.overrideWithValue(storage),
      ],
    );
    addTearDown(() {
      container.dispose();
      db.close();
    });

    final auth = await container.read(authProvider.future);
    expect(auth, isNull);
  });

  test('saved trainer must exist in database', () async {
    final storage = MemoryAuthStorage('42');
    final db = await memoryDatabase();
    final container = ProviderContainer(
      overrides: [
        databaseProvider.overrideWithValue(db),
        authStorageProvider.overrideWithValue(storage),
      ],
    );
    addTearDown(() {
      container.dispose();
      db.close();
    });
    expect(await container.read(authProvider.future), isNull);
    expect(storage.value, isNull);
  });

  test('setup stores salted hash instead of plaintext', () async {
    final storage = MemoryAuthStorage();
    final db = await memoryDatabase();
    final container = ProviderContainer(
      overrides: [
        databaseProvider.overrideWithValue(db),
        authStorageProvider.overrideWithValue(storage),
      ],
    );
    addTearDown(() {
      container.dispose();
      db.close();
    });
    await container.read(authProvider.future);
    expect(
      await container
          .read(authProvider.notifier)
          .setup('Trainer', 'TRAINER@example.com', 'strongpass123'),
      isNull,
    );
    final trainer = await db.select(db.trainers).getSingle();
    expect(trainer.passwordHash, isNot('strongpass123'));
    expect(trainer.passwordSalt, isNotEmpty);
    expect(
      await verifyPassword(
        'strongpass123',
        trainer.passwordSalt,
        trainer.passwordHash,
      ),
      isTrue,
    );
    expect(
      await verifyPassword(
        'wrongpass',
        trainer.passwordSalt,
        trainer.passwordHash,
      ),
      isFalse,
    );
    expect(storage.value, '${trainer.id}');
  });

  test('theme mode persists and reloads', () async {
    final first = ProviderContainer();
    await first.read(themeProvider.future);
    await first.read(themeProvider.notifier).setMode(ThemeMode.dark);
    first.dispose();
    final second = ProviderContainer();
    addTearDown(second.dispose);
    expect(await second.read(themeProvider.future), ThemeMode.dark);
  });
}
