import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts/core/presentation/widgets/primary_button.dart';

import '../../../support/pump_app.dart';

Future<void> _tapText(WidgetTester tester, String text) async {
  await tester.tap(find.text(text));
  await tester.pumpAndSettle();
}

Future<void> _enter(WidgetTester tester, String text, {int field = 0}) async {
  await tester.enterText(find.byType(TextField).at(field), text);
  await tester.pumpAndSettle();
}

VoidCallback? _continueAction(WidgetTester tester) =>
    tester.widget<PrimaryButton>(find.byType(PrimaryButton)).onPressed;

Future<void> _reachPhoneStep(WidgetTester tester, {bool login = false}) async {
  await pumpApp(tester);
  await _tapText(tester, login ? 'Log in' : "LET'S GET STARTED");
}

Future<void> _reachOtpStep(WidgetTester tester) async {
  await _reachPhoneStep(tester);
  await _enter(tester, '09254135592');
  await _tapText(tester, 'CONTINUE');
}

Future<void> _passOtp(WidgetTester tester) async {
  await _enter(tester, '123456');
  await tester.pumpAndSettle();
}

void main() {
  group('phone step', () {
    testWidgets('keeps Continue disabled for an invalid number', (t) async {
      await _reachPhoneStep(t);
      await _enter(t, '123');

      expect(_continueAction(t), isNull);
    });

    testWidgets('enables Continue for a valid number with spaces and a 0', (
      t,
    ) async {
      await _reachPhoneStep(t);
      await _enter(t, '09 254-135 592');

      expect(_continueAction(t), isNotNull);
    });

    testWidgets('shows the format message once the field loses focus', (
      t,
    ) async {
      await _reachPhoneStep(t);
      await _enter(t, '123');
      expect(find.textContaining('valid Myanmar number'), findsNothing);

      FocusManager.instance.primaryFocus?.unfocus();
      await t.pumpAndSettle();

      expect(find.textContaining('valid Myanmar number'), findsOneWidget);
    });

    testWidgets('login with an unregistered number offers to register', (
      t,
    ) async {
      await _reachPhoneStep(t, login: true);
      await _enter(t, '09254135592');
      await _tapText(t, 'CONTINUE');

      expect(find.textContaining("isn't registered"), findsOneWidget);
      expect(find.text('Register'), findsOneWidget);
    });
  });

  group('otp step', () {
    testWidgets('a wrong code reports the attempts left and clears the boxes', (
      t,
    ) async {
      await _reachOtpStep(t);
      await _enter(t, '111111');

      expect(find.textContaining('2 attempts left'), findsOneWidget);
    });

    testWidgets('three wrong codes lock entry until Resend', (t) async {
      await _reachOtpStep(t);
      for (var i = 0; i < 3; i++) {
        await _enter(t, '111111');
      }

      expect(find.textContaining('Too many wrong codes'), findsOneWidget);
      expect(find.text('Resend code'), findsOneWidget);
    });

    testWidgets('resend after a lock lifts it', (t) async {
      await _reachOtpStep(t);
      for (var i = 0; i < 3; i++) {
        await _enter(t, '111111');
      }
      await _tapText(t, 'Resend code');

      expect(find.textContaining('Too many wrong codes'), findsNothing);
    });

    testWidgets('counts down from 5:00', (t) async {
      await _reachOtpStep(t);
      expect(find.textContaining('5:00 min'), findsOneWidget);

      await t.pump(const Duration(seconds: 2));

      expect(find.textContaining('4:58 min'), findsOneWidget);
    });

    testWidgets('offers Resend once the countdown reaches zero', (t) async {
      await _reachOtpStep(t);

      await t.pump(const Duration(minutes: 5));
      await t.pump();

      expect(find.text('Resend code'), findsOneWidget);
    });
  });

  group('name step', () {
    testWidgets('does not autocorrect or suggest in either name field', (
      t,
    ) async {
      await _reachOtpStep(t);
      await _passOtp(t);

      for (final field in t.widgetList<TextField>(find.byType(TextField))) {
        expect(field.autocorrect, isFalse);
        expect(field.enableSuggestions, isFalse);
      }
    });
  });

  group('registration', () {
    testWidgets('rejects 31 April on the date of birth step', (t) async {
      await _reachOtpStep(t);
      await _passOtp(t);
      await _enter(t, 'Ye Min');
      await _tapText(t, 'CONTINUE');
      await _tapText(t, 'Month');
      await _tapText(t, 'April');
      await _enter(t, '31', field: 1);
      await _enter(t, '1990', field: 2);

      expect(find.text("That date doesn't exist."), findsOneWidget);
      expect(_continueAction(t), isNull);
    });

    testWidgets('rejects someone under 13', (t) async {
      await _reachOtpStep(t);
      await _passOtp(t);
      await _enter(t, 'Ye Min');
      await _tapText(t, 'CONTINUE');
      await _tapText(t, 'Month');
      await _tapText(t, 'January');
      await _enter(t, '1', field: 1);
      await _enter(t, '2020', field: 2);

      expect(find.textContaining('at least 13'), findsOneWidget);
    });
  });
}
