import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:jdonuts/core/presentation/widgets/drift_in.dart';
import 'package:jdonuts/core/presentation/widgets/staggered_entrance.dart';
import 'package:jdonuts/features/auth/presentation/screens/welcome_screen.dart';

import '../../../support/pump_app.dart';

const String _onboardingTitle = 'Round food for every mood';
const String _welcomeTitle = "Welcome to the world of J'donuts";

/// Opacity of the fade that belongs to the entrance wrapping [inner].
double _opacityOf<T extends Widget>(WidgetTester tester, Finder inner) {
  final wrapper = find.ancestor(of: inner, matching: find.byType(T));
  final fade = find.descendant(
    of: wrapper.first,
    matching: find.byType(FadeTransition),
  );
  return tester.widget<FadeTransition>(fade.first).opacity.value;
}

double _driftOpacity(WidgetTester tester, int index, {Finder? within}) {
  final drifts = within == null
      ? find.byType(DriftIn)
      : find.descendant(of: within, matching: find.byType(DriftIn));
  final fade = find.descendant(
    of: drifts.at(index),
    matching: find.byType(FadeTransition),
  );
  return tester.widget<FadeTransition>(fade.first).opacity.value;
}

/// Pumps frame by frame until the onboarding screen has just been built.
Future<void> _launchUnsettled(WidgetTester tester) async {
  await pumpApp(tester, settle: false);
  for (
    var i = 0;
    i < 40 && find.text(_onboardingTitle).evaluate().isEmpty;
    i++
  ) {
    await tester.pump(const Duration(milliseconds: 20));
  }
}

void main() {
  group('Onboarding motion', () {
    testApp('five donut circles are present', (tester) async {
      await pumpApp(tester);

      expect(find.byType(DriftIn), findsNWidgets(5));
    });

    testApp('circles drift in one after another, then everything is visible', (
      tester,
    ) async {
      await _launchUnsettled(tester);
      await tester.pump(const Duration(milliseconds: 150));

      expect(_driftOpacity(tester, 0), greaterThan(_driftOpacity(tester, 4)));

      await tester.pumpAndSettle();

      for (var i = 0; i < 5; i++) {
        expect(_driftOpacity(tester, i), closeTo(1, 0.001));
      }
    });

    testApp('the title enters after the circles and fades up', (tester) async {
      await _launchUnsettled(tester);
      expect(
        _opacityOf<StaggeredEntrance>(tester, find.text(_onboardingTitle)),
        lessThan(0.5),
      );

      await tester.pumpAndSettle();

      expect(
        _opacityOf<StaggeredEntrance>(tester, find.text(_onboardingTitle)),
        closeTo(1, 0.001),
      );
    });

    testApp('Reduce Motion shows everything in place at once', (tester) async {
      tester.platformDispatcher.accessibilityFeaturesTestValue =
          const FakeAccessibilityFeatures(disableAnimations: true);
      addTearDown(
        tester.platformDispatcher.clearAccessibilityFeaturesTestValue,
      );
      await _launchUnsettled(tester);

      expect(_driftOpacity(tester, 4), closeTo(1, 0.001));
      expect(
        _opacityOf<StaggeredEntrance>(tester, find.text(_onboardingTitle)),
        closeTo(1, 0.001),
      );
    });
  });

  group('Welcome motion', () {
    Future<void> openWelcomeUnsettled(WidgetTester tester) async {
      await pumpApp(tester);
      GoRouter.of(tester.element(find.byType(Scaffold).first)).go('/welcome');
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
    }

    testApp('four tiles slide in before the title appears', (tester) async {
      await openWelcomeUnsettled(tester);
      await tester.pump(const Duration(milliseconds: 200));

      // The onboarding page is still fading out underneath, so scope to Welcome.
      final welcome = find.byType(WelcomeScreen);
      expect(
        find.descendant(of: welcome, matching: find.byType(DriftIn)),
        findsNWidgets(4),
      );
      expect(
        _driftOpacity(tester, 0, within: welcome),
        greaterThan(
          _opacityOf<StaggeredEntrance>(tester, find.text(_welcomeTitle)),
        ),
      );
    });

    testApp('the title ends fully visible', (tester) async {
      await openWelcomeUnsettled(tester);

      await tester.pumpAndSettle();

      expect(
        _opacityOf<StaggeredEntrance>(tester, find.text(_welcomeTitle)),
        closeTo(1, 0.001),
      );
    });
  });
}
