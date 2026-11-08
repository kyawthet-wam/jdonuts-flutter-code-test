import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts/core/database/app_database.dart';
import 'package:jdonuts/core/router/app_routes.dart';
import 'package:jdonuts/features/product/data/drift_cart_repository.dart';

import '../../support/pump_app.dart';
import '../../support/test_database.dart';

Future<void> _openCoconut(WidgetTester tester, {AppDatabase? db}) async {
  await pumpApp(tester, signedIn: true, database: db);
  await pushRoute(tester, AppRoutes.product('p_coconut'));
}

void main() {
  testApp('shows the Coconut Donut reference details', (tester) async {
    await _openCoconut(tester);

    expect(find.text('Coconut Donut'), findsOneWidget);
    expect(find.text('JD022123'), findsOneWidget);
    expect(find.text('3,200 MMK'), findsOneWidget);
    expect(find.text('New'), findsOneWidget);
    expect(find.textContaining('scrumptious donuts'), findsOneWidget);
  });

  testApp('quantity starts at 1 and the total follows it', (tester) async {
    await _openCoconut(tester);
    expect(find.textContaining('ADD TO CART  |  3,200 MMK'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.textContaining('ADD TO CART  |  6,400 MMK'), findsOneWidget);
  });

  testApp('quantity cannot go below 1', (tester) async {
    await _openCoconut(tester);

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pumpAndSettle();

    expect(find.textContaining('3,200 MMK'), findsWidgets);
    expect(find.textContaining('ADD TO CART  |  3,200 MMK'), findsOneWidget);
  });

  testApp('adding to the cart confirms and stores the line', (tester) async {
    final db = (await tester.runAsync(seededDatabase))!;
    await _openCoconut(tester, db: db);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.tap(find.textContaining('ADD TO CART'));
    await tester.pumpAndSettle();

    expect(find.text('ADDED TO CART'), findsOneWidget);
    final lines = await tester.runAsync(
      () => DriftCartRepository(db).watchCart().first,
    );
    expect(lines!.single.quantity, 2);
    await tester.pump(const Duration(seconds: 2));
  });

  testApp('leaving right after adding to the cart causes no late errors', (
    tester,
  ) async {
    await _openCoconut(tester);
    await tester.tap(find.textContaining('ADD TO CART'));
    await tester.pump(const Duration(milliseconds: 100));

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 3)); // past the 1.5s reset

    expect(tester.takeException(), isNull);
  });

  testApp('an unknown product shows an unavailable message', (tester) async {
    await pumpApp(tester, signedIn: true);
    await pushRoute(tester, AppRoutes.product('does_not_exist'));

    expect(find.text("This product isn't available."), findsOneWidget);
  });

  testApp('back returns to Home', (tester) async {
    await _openCoconut(tester);

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.text('Seasonal specials'), findsOneWidget);
  });
}
