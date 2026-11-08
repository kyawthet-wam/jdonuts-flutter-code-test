import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jdonuts/app.dart';
import 'package:jdonuts/core/storage/key_value_store.dart';
import 'package:jdonuts/features/auth/data/fake_auth_repository.dart';
import 'package:jdonuts/features/auth/domain/entities/auth_user.dart';
import 'package:jdonuts/features/auth/presentation/providers/auth_providers.dart';

Future<InMemoryKeyValueStore> _storeWithSignedInUser() async {
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

Future<void> _launch(WidgetTester tester, InMemoryKeyValueStore store) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        authRepositoryProvider.overrideWith(
          (ref) => FakeAuthRepository(store, latency: Duration.zero),
        ),
      ],
      child: const JDonutsApp(),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('launching logged out opens onboarding', (tester) async {
    await _launch(tester, InMemoryKeyValueStore());

    expect(find.text("LET'S GET STARTED"), findsOneWidget);
  });

  testWidgets('launching with a stored session opens home', (tester) async {
    await _launch(tester, (await tester.runAsync(_storeWithSignedInUser))!);

    expect(find.text('home'), findsOneWidget);
  });

  testWidgets('logging out from settings returns to onboarding', (
    tester,
  ) async {
    await _launch(tester, (await tester.runAsync(_storeWithSignedInUser))!);

    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Log out'));
    await tester.pumpAndSettle();

    expect(find.text("LET'S GET STARTED"), findsOneWidget);
  });
}
