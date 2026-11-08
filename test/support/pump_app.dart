import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jdonuts/app.dart';
import 'package:jdonuts/core/connectivity/connectivity_providers.dart';
import 'package:jdonuts/core/storage/key_value_store.dart';
import 'package:jdonuts/core/time/clock.dart';
import 'package:jdonuts/features/auth/data/fake_auth_repository.dart';
import 'package:jdonuts/features/auth/presentation/providers/auth_providers.dart';

import 'fake_connectivity.dart';

/// Fixed "today" so age rules never drift with the real date.
final DateTime testNow = DateTime(2026, 11, 8);

/// Launches the whole app on a modern-phone sized surface with an in-memory
/// store and zero fake latency.
Future<void> pumpApp(
  WidgetTester tester, {
  InMemoryKeyValueStore? store,
  FakeConnectivityService? connectivity,
}) async {
  tester.view.physicalSize = const Size(1170, 2532);
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);
  final keyValueStore = store ?? InMemoryKeyValueStore();
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
      ],
      child: const JDonutsApp(),
    ),
  );
  await tester.pumpAndSettle();
}
