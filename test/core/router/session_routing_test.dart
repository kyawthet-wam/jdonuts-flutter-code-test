import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/pump_app.dart';

void main() {
  testApp('launching logged out opens onboarding', (tester) async {
    await pumpApp(tester);

    expect(find.text("LET'S GET STARTED"), findsOneWidget);
  });

  testApp('launching with a stored session opens home', (tester) async {
    await pumpApp(tester, signedIn: true);

    expect(find.text('Seasonal specials'), findsOneWidget);
  });

  testApp('logging out from settings returns to onboarding', (tester) async {
    await pumpApp(tester, signedIn: true);

    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Log out'));
    await tester.pumpAndSettle();

    expect(find.text("LET'S GET STARTED"), findsOneWidget);
  });
}
