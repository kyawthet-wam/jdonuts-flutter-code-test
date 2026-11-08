import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts/core/theme/app_colors.dart';
import 'package:jdonuts/features/home/data/home_providers.dart';

import '../../support/fake_connectivity.dart';
import '../../support/pump_app.dart';

void main() {
  group('Home', () {
    testApp('shows the member, tier and points to the next tier', (
      tester,
    ) async {
      await pumpApp(tester, signedIn: true);

      expect(find.text('Hania'), findsOneWidget);
      expect(find.text('Silver member'), findsOneWidget);
      expect(
        find.text('500 points left to become Gold Member'),
        findsOneWidget,
      );
    });

    testApp('shows the notification count from data', (tester) async {
      await pumpApp(tester, signedIn: true);

      expect(find.text('2'), findsOneWidget);
    });

    testApp('lists the three product sections', (tester) async {
      await pumpApp(tester, signedIn: true);
      await tester.drag(find.byType(ListView).first, const Offset(0, -600));
      await tester.pumpAndSettle();

      expect(find.text('Seasonal specials'), findsOneWidget);
      expect(find.text('Popular'), findsOneWidget);
    });

    testApp('shows discount badges from data', (tester) async {
      await pumpApp(tester, signedIn: true);

      expect(find.text('50% off'), findsWidgets);
    });

    testApp('popular tiles are taller than order again tiles', (tester) async {
      await pumpApp(tester, signedIn: true);
      await tester.dragUntilVisible(
        find.text("Santa's favorite cookies set"),
        find.byType(ListView).first,
        const Offset(0, -300),
      );

      double heroHeight(String tag) => tester
          .getSize(
            find.byWidgetPredicate(
              (w) => w is Hero && w.tag == tag,
              skipOffstage: false,
            ),
          )
          .height;

      expect(
        heroHeight('product-s_popular-p_strawberry'),
        greaterThan(heroHeight('product-s_order_again-p_cookies')),
      );
    });

    testApp('the shops block runs to the bottom with no gap below it', (
      tester,
    ) async {
      await pumpApp(tester, signedIn: true);
      await tester.dragUntilVisible(
        find.textContaining("J'Donut shops"),
        find.byType(ListView).first,
        const Offset(0, -300),
      );
      await tester.drag(find.byType(ListView).first, const Offset(0, -2000));
      await tester.pumpAndSettle();

      final shopsBlock = tester.getRect(
        find.byWidgetPredicate(
          (w) =>
              w is Container &&
              w.decoration is BoxDecoration &&
              (w.decoration! as BoxDecoration).color == AppColors.primary,
        ),
      );
      final navTop = tester.getTopLeft(find.byType(NavigationBar)).dy;

      expect(navTop - shopsBlock.bottom, lessThan(1));
    });

    testApp('section titles are clearly larger than product names', (
      tester,
    ) async {
      await pumpApp(tester, signedIn: true);

      double size(String text) =>
          tester.widget<Text>(find.text(text).first).style!.fontSize!;

      expect(
        size('Seasonal specials'),
        greaterThan(size('Mistletoe Romance box') * 1.5),
      );
    });

    testApp('says how many shops are nearby', (tester) async {
      await pumpApp(tester, signedIn: true);
      await tester.dragUntilVisible(
        find.textContaining("J'Donut shops"),
        find.byType(ListView).first,
        const Offset(0, -300),
      );

      expect(find.text("There are 4 J'Donut shops near you."), findsOneWidget);
    });

    testApp('opens the product detail when a tile is tapped', (tester) async {
      await pumpApp(tester, signedIn: true);

      await tester.tap(find.text('Mistletoe Romance box'));
      await tester.pumpAndSettle();

      expect(find.text('JD030101'), findsOneWidget);
      expect(find.text('24,000 MMK'), findsOneWidget);
    });

    testApp('a failing section shows its own error and a retry', (
      tester,
    ) async {
      await pumpApp(
        tester,
        signedIn: true,
        overrides: [
          homeSectionsProvider.overrideWith(
            (ref) => Stream<List<Never>>.error(Exception('boom')).cast(),
          ),
        ],
      );

      expect(find.text("Couldn't load this section."), findsOneWidget);
      expect(find.text('Try again'), findsOneWidget);
      expect(find.text('Hania'), findsOneWidget); // the rest still renders
    });

    testApp('shows an offline banner while offline and hides it online', (
      tester,
    ) async {
      final connectivity = FakeConnectivityService();
      await pumpApp(tester, signedIn: true, connectivity: connectivity);
      expect(find.textContaining("You're offline"), findsNothing);

      connectivity.setOnline(false);
      await tester.pumpAndSettle();
      expect(find.textContaining("You're offline"), findsOneWidget);

      connectivity.setOnline(true);
      await tester.pumpAndSettle();
      expect(find.textContaining("You're offline"), findsNothing);
    });

    testApp('keeps rendering saved data while offline', (tester) async {
      await pumpApp(
        tester,
        signedIn: true,
        connectivity: FakeConnectivityService(false),
      );

      expect(find.text('Hania'), findsOneWidget);
      expect(find.text('Seasonal specials'), findsOneWidget);
    });
  });
}
