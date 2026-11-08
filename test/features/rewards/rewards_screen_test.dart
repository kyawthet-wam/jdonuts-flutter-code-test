import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts/core/presentation/widgets/bottom_nav/crown_icon.dart';
import 'package:jdonuts/core/theme/app_colors.dart';

import '../../support/pump_app.dart';

Future<void> _openRewards(WidgetTester tester, {bool settle = true}) async {
  await pumpApp(tester, signedIn: true);
  await tester.tap(find.byType(CrownIcon));
  if (settle) await tester.pumpAndSettle();
}

Finder _earnSemantics() => find.bySemanticsLabel('Earn 100 points');

void main() {
  group('Rewards content', () {
    testApp('shows the title and the rewards badge count', (tester) async {
      await _openRewards(tester);

      expect(find.text("J' Donuts Rewards"), findsOneWidget);
      expect(find.text('Rewards'), findsWidgets);
      expect(find.text('3'), findsOneWidget);
    });

    testApp('lists Silver, Gold and Platinum with the current tier marked', (
      tester,
    ) async {
      await _openRewards(tester);

      expect(find.text('Silver'), findsOneWidget);
      expect(find.text('Gold'), findsOneWidget);
      expect(find.text('Platinum'), findsOneWidget);
      expect(find.text("You're here now"), findsOneWidget);
      expect(find.text('500 pts Remaining to become Gold'), findsOneWidget);
      expect(find.text("You'll be here soon"), findsOneWidget);
    });

    testApp('agrees with Home about tier and points (one member record)', (
      tester,
    ) async {
      await pumpApp(tester, signedIn: true);
      expect(find.text('Silver member'), findsOneWidget);
      expect(
        find.text('500 points left to become Gold Member'),
        findsOneWidget,
      );

      await tester.tap(find.byType(CrownIcon));
      await tester.pumpAndSettle();

      expect(find.text("You're here now"), findsOneWidget);
      expect(find.text('500 pts Remaining to become Gold'), findsOneWidget);
    });

    testApp('shows the three challenges with their progress', (tester) async {
      await _openRewards(tester);

      expect(find.text('Eat 4 Coco donuts'), findsNWidgets(2));
      expect(find.text('Drink 12 cups americano'), findsOneWidget);
      expect(find.text('4/4'), findsOneWidget);
      expect(find.text('1/4'), findsOneWidget);
      expect(find.text('9/12'), findsOneWidget);
      expect(find.text('100 pts'), findsNWidgets(3));
    });
  });

  group('Rewards motion', () {
    testApp('the total counts up from 0 to 680,000', (tester) async {
      await _openRewards(tester, settle: false);
      await tester.pump(); // build the Rewards tab
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text('680,000'), findsNothing);

      await tester.pumpAndSettle();

      expect(find.text('680,000'), findsOneWidget);
    });

    testApp('Reduce Motion shows the final total immediately', (tester) async {
      tester.platformDispatcher.accessibilityFeaturesTestValue =
          const FakeAccessibilityFeatures(disableAnimations: true);
      addTearDown(
        tester.platformDispatcher.clearAccessibilityFeaturesTestValue,
      );
      await _openRewards(tester, settle: false);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.text('680,000'), findsOneWidget);
    });

    testApp('the rewards badge pops in from nothing', (tester) async {
      await _openRewards(tester, settle: false);
      await tester.pump();
      double badgeScale() => tester
          .widget<Transform>(
            find
                .ancestor(
                  of: find.text('Rewards'),
                  matching: find.byType(Transform),
                )
                .first,
          )
          .transform
          .entry(0, 0); // x scale (getMaxScaleOnAxis would include z = 1)
      await tester.pump(const Duration(milliseconds: 40));
      final early = badgeScale();

      await tester.pumpAndSettle();

      expect(early, lessThan(1));
      expect(badgeScale(), closeTo(1, 0.001));
    });
  });

  group('Rewards tabs', () {
    testApp('switching to Gift swaps the challenge list for the gift view', (
      tester,
    ) async {
      await _openRewards(tester);

      await tester.tap(find.text('Gift'));
      await tester.pumpAndSettle();

      expect(find.text('Gifts are on their way.'), findsOneWidget);
      expect(find.text('Eat 4 Coco donuts'), findsNothing);
    });

    testApp('switching back restores the challenges', (tester) async {
      await _openRewards(tester);
      await tester.tap(find.text('Gift'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Eat more earn more'));
      await tester.pumpAndSettle();

      expect(find.text('Eat 4 Coco donuts'), findsNWidgets(2));
    });

    testApp('the blue indicator slides to the selected tab', (tester) async {
      await _openRewards(tester);
      final indicator = find.byWidgetPredicate(
        (w) =>
            w is DecoratedBox &&
            w.decoration is BoxDecoration &&
            (w.decoration as BoxDecoration).color == AppColors.primary &&
            (w.decoration as BoxDecoration).border != null,
      );
      final before = tester.getTopLeft(indicator).dx;

      await tester.tap(find.text('Gift'));
      await tester.pumpAndSettle();

      expect(tester.getTopLeft(indicator).dx, greaterThan(before));
    });
  });

  group('Earn buttons', () {
    testApp('only the completed challenge is active', (tester) async {
      await _openRewards(tester);

      final active = isSemantics(
        isButton: true,
        hasEnabledState: true,
        isEnabled: true,
      );
      final inactive = isSemantics(
        isButton: true,
        hasEnabledState: true,
        isEnabled: false,
      );
      expect(tester.getSemantics(_earnSemantics().at(0)), active);
      expect(tester.getSemantics(_earnSemantics().at(1)), inactive);
      expect(tester.getSemantics(_earnSemantics().at(2)), inactive);
    });

    testApp('tapping Earn gives feedback but changes nothing', (tester) async {
      await _openRewards(tester);

      await tester.tap(find.text('EARN').first);
      await tester.pumpAndSettle();

      expect(find.text('4/4'), findsOneWidget);
      expect(find.text('680,000'), findsOneWidget);
    });
  });
}
