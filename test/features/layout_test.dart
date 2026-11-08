import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts/core/router/app_routes.dart';

import '../support/pump_app.dart';

/// Portrait phones from 4.7" to 6.9", with text scaled up to 1.3x, must lay
/// out without overflow (the test framework fails a test on any overflow).
const Map<String, Size> _phones = {
  'small 4.7in': Size(360, 640),
  'large 6.9in': Size(440, 956),
};
const double _maxTextScale = 1.3;

Future<void> _scrollThrough(WidgetTester tester) async {
  final list = find.byType(ListView).first;
  for (var i = 0; i < 6; i++) {
    await tester.drag(list, const Offset(0, -500));
    await tester.pumpAndSettle();
  }
}

void main() {
  for (final MapEntry(key: name, value: size) in _phones.entries) {
    group('$name at text scale $_maxTextScale', () {
      testApp('onboarding lays out', (tester) async {
        await pumpApp(tester, logicalSize: size, textScale: _maxTextScale);

        expect(find.text("LET'S GET STARTED"), findsOneWidget);
      });

      testApp('phone step lays out', (tester) async {
        await pumpApp(tester, logicalSize: size, textScale: _maxTextScale);
        await tester.tap(find.text("LET'S GET STARTED"));
        await tester.pumpAndSettle();

        expect(find.text('Enter your phone number'), findsOneWidget);
      });

      testApp('home lays out from top to bottom', (tester) async {
        await pumpApp(
          tester,
          signedIn: true,
          logicalSize: size,
          textScale: _maxTextScale,
        );

        await _scrollThrough(tester);

        expect(find.text('Order Online'), findsWidgets);
      });

      testApp('product detail lays out', (tester) async {
        await pumpApp(
          tester,
          signedIn: true,
          logicalSize: size,
          textScale: _maxTextScale,
        );
        await pushRoute(tester, AppRoutes.product('p_christmas'));

        expect(find.text('Christmas Mix Family box'), findsOneWidget);
      });
    });
  }
}
