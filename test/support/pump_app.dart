import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/misc.dart' show Override;
import 'package:jdonuts/app.dart';
import 'package:jdonuts/core/connectivity/connectivity_providers.dart';
import 'package:jdonuts/core/database/app_database.dart';
import 'package:jdonuts/core/database/database_providers.dart';
import 'package:jdonuts/core/storage/key_value_store.dart';
import 'package:jdonuts/core/time/clock.dart';
import 'package:jdonuts/features/auth/data/fake_auth_repository.dart';
import 'package:jdonuts/features/auth/domain/entities/auth_user.dart';
import 'package:jdonuts/features/auth/presentation/providers/auth_providers.dart';

import 'fake_connectivity.dart';
import 'test_database.dart';

/// Fixed "today" so age rules never drift with the real date.
final DateTime testNow = DateTime(2026, 11, 8);

/// A store that already holds a registered, signed-in user (relaunch case).
Future<InMemoryKeyValueStore> signedInStore() async {
  final store = InMemoryKeyValueStore();
  final repo = FakeAuthRepository(store, latency: Duration.zero);
  final user = (await repo.completeRegistration(
    RegistrationData(
      phoneE164: '+959254135592',
      firstName: 'Ye Min',
      lastName: '',
      dateOfBirth: DateTime(1980, 5, 1),
    ),
  )).valueOrNull!;
  await repo.startSession(user);
  return store;
}

/// Launches the whole app on a modern-phone sized surface with an in-memory
/// auth store, an in-memory database already seeded from the bundled JSON, fake connectivity and zero fake latency.
///
/// Pass [signedIn] to start on Home instead of Onboarding.
Future<void> pumpApp(
  WidgetTester tester, {
  InMemoryKeyValueStore? store,
  AppDatabase? database,
  FakeConnectivityService? connectivity,
  bool signedIn = false,
  List<Override> overrides = const [],
  Size logicalSize = const Size(390, 844),
  double textScale = 1,
  bool settle = true,
}) async {
  tester.view.physicalSize = logicalSize * 3;
  tester.view.devicePixelRatio = 3;
  tester.platformDispatcher.textScaleFactorTestValue = textScale;
  addTearDown(tester.view.reset);
  addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
  final keyValueStore =
      store ??
      (signedIn
          ? (await tester.runAsync(signedInStore))!
          : InMemoryKeyValueStore());
  final db = database ?? (await tester.runAsync(seededDatabase))!;
  // Plain close: tester.runAsync inside a tearDown can wait forever.
  addTearDown(db.close);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        authRepositoryProvider.overrideWith(
          (ref) => FakeAuthRepository(keyValueStore, latency: Duration.zero),
        ),
        clockProvider.overrideWithValue(() => testNow),
        connectivityServiceProvider.overrideWithValue(
          connectivity ?? FakeConnectivityService(),
        ),
        appDatabaseProvider.overrideWithValue(db),
        // Seeded above with real file IO, which can't run in fake-async time.
        databaseSeedProvider.overrideWith((ref) async {}),
        ...overrides,
      ],
      child: const JDonutsApp(),
    ),
  );
  if (settle) await tester.pumpAndSettle();
}

/// Navigates the running app, e.g. `/product/p_coconut`.
Future<void> pushRoute(WidgetTester tester, String location) async {
  unawaited(
    GoRouter.of(tester.element(find.byType(Scaffold).first)).push(location),
  );
  await tester.pumpAndSettle();
}

/// `testWidgets` that tears the app down cleanly.
///
/// Drift schedules a zero-length timer when a stream is cancelled; without a
/// final pump after disposal the framework reports it as a leaked timer.
void testApp(
  String description,
  Future<void> Function(WidgetTester tester) body,
) {
  testWidgets(description, (tester) async {
    await body(tester);
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 1));
  });
}
