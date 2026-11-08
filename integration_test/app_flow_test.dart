import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:integration_test/integration_test.dart';
import 'package:jdonuts/app.dart';
import 'package:jdonuts/core/database/app_database.dart';
import 'package:jdonuts/core/database/database_providers.dart';
import 'package:jdonuts/core/storage/key_value_store.dart';
import 'package:jdonuts/features/auth/presentation/providers/auth_providers.dart';

/// Real app, real router, real Drift (in memory) and the real bundled seed.
/// Only storage is isolated, so a run never depends on what is on the device.
///
/// Run with `fvm flutter test integration_test -d SIMULATOR_ID`.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  const phone = '09254135592';
  const fakeOtp = '123456';

  /// Launches the app with empty, in-memory storage.
  Future<void> launch(WidgetTester tester) async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          keyValueStoreProvider.overrideWithValue(InMemoryKeyValueStore()),
          appDatabaseProvider.overrideWithValue(database),
        ],
        child: const JDonutsApp(),
      ),
    );
  }

  /// Waits (in real time) for [finder]: the fake backend takes about a second
  /// per step, so a plain pumpAndSettle can return too early.
  Future<void> waitFor(
    WidgetTester tester,
    Finder finder, {
    Duration timeout = const Duration(seconds: 20),
  }) async {
    final end = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(end)) {
      await tester.pump(const Duration(milliseconds: 100));
      if (finder.evaluate().isNotEmpty) {
        // Let page transitions finish so taps land on the new screen.
        await tester.pumpAndSettle(
          const Duration(milliseconds: 100),
          EnginePhase.sendSemanticsUpdate,
          const Duration(seconds: 5),
        );
        return;
      }
    }
    fail('Timed out waiting for $finder');
  }

  Future<void> tapText(WidgetTester tester, String text) async {
    await tester.tap(find.text(text));
    await tester.pump(const Duration(milliseconds: 100));
  }

  Future<void> signInThroughPhoneAndOtp(WidgetTester tester) async {
    await tester.enterText(find.byType(TextField).first, phone);
    await tester.pump(const Duration(milliseconds: 200));
    await tapText(tester, 'CONTINUE');
    await waitFor(tester, find.text('Verify your number'));
    await tester.enterText(find.byType(TextField).first, fakeOtp);
  }

  Future<void> register(WidgetTester tester) async {
    await waitFor(tester, find.text("LET'S GET STARTED"));
    await tapText(tester, "LET'S GET STARTED");
    await waitFor(tester, find.text('Enter your phone number'));
    await signInThroughPhoneAndOtp(tester);

    await waitFor(tester, find.text("What's your name?"));
    await tester.enterText(find.byType(TextField).at(0), 'Ye Min');
    await tester.enterText(find.byType(TextField).at(1), 'Phyoe Win');
    await tester.pump(const Duration(milliseconds: 200));
    await tapText(tester, 'CONTINUE');

    await waitFor(tester, find.text("What's your date of birth?"));
    // Tap the (read-only) field itself, not its hint text.
    await tester.tap(find.byType(TextField).at(0));
    await tester.pump(const Duration(milliseconds: 400));
    await tapText(tester, 'May');
    await tester.pump(const Duration(milliseconds: 400));
    await tester.enterText(find.byType(TextField).at(1), '1');
    await tester.enterText(find.byType(TextField).at(2), '1980');
    await tester.pump(const Duration(milliseconds: 200));
    await tapText(tester, 'CONTINUE');

    await waitFor(tester, find.text("Welcome to the world of J'donuts"));
    await tapText(tester, "LET'S EXPLORE");
    await waitFor(tester, find.text('Seasonal specials'));
  }

  testWidgets('Register -> Home -> Product detail -> Add to cart', (
    tester,
  ) async {
    await launch(tester);

    await register(tester);

    expect(find.text('Hania'), findsOneWidget);
    expect(find.text('Silver member'), findsOneWidget);

    await tapText(tester, 'Mistletoe Romance box');
    await waitFor(tester, find.text('JD030101'));
    expect(find.text('24,000 MMK'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.textContaining('48,000 MMK'), findsOneWidget);

    await tester.tap(find.textContaining('ADD TO CART'));
    await waitFor(tester, find.text('ADDED TO CART'));

    await tester.tap(find.byIcon(Icons.arrow_back));
    await waitFor(tester, find.text('Seasonal specials'));
  });

  testWidgets('Register -> Rewards -> Log out -> Log in -> Home', (
    tester,
  ) async {
    await launch(tester);
    await register(tester);

    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pump(const Duration(milliseconds: 600));
    await tester.tap(find.text('Log out'));
    await waitFor(tester, find.text("LET'S GET STARTED"));

    await tapText(tester, 'Log in');
    await waitFor(tester, find.text('Enter your phone number'));
    await signInThroughPhoneAndOtp(tester);

    await waitFor(tester, find.text('Seasonal specials'));
    expect(find.text('Hania'), findsOneWidget);
  });
}
