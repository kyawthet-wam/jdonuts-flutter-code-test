import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts/core/result/failure.dart';
import 'package:jdonuts/features/product/data/drift_cart_repository.dart';
import 'package:jdonuts/features/product/domain/quantity_rules.dart';
import 'package:jdonuts/features/product/domain/use_cases/add_to_cart.dart';

import '../../../support/test_database.dart';

void main() {
  test('rejects a quantity below the minimum', () async {
    final db = await seededDatabase();
    addTearDown(db.close);

    final result = await AddToCart(DriftCartRepository(db))('p_coconut', 0);

    expect(result.failureOrNull, isA<InvalidInputFailure>());
  });

  test('rejects a quantity above the maximum', () async {
    final db = await seededDatabase();
    addTearDown(db.close);

    final result = await AddToCart(DriftCartRepository(db))(
      'p_coconut',
      maxProductQuantity + 1,
    );

    expect(result.failureOrNull, isA<InvalidInputFailure>());
  });

  test('stores a valid quantity', () async {
    final db = await seededDatabase();
    addTearDown(db.close);
    final cart = DriftCartRepository(db);

    await AddToCart(cart)('p_coconut', 3);

    expect((await cart.watchCart().first).single.quantity, 3);
  });

  test('clampQuantity keeps values inside the allowed range', () {
    expect(clampQuantity(-5), minProductQuantity);
    expect(clampQuantity(1000), maxProductQuantity);
    expect(clampQuantity(7), 7);
  });
}
