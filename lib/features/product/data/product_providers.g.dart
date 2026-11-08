// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(productRepository)
final productRepositoryProvider = ProductRepositoryProvider._();

final class ProductRepositoryProvider
    extends
        $FunctionalProvider<
          ProductRepository,
          ProductRepository,
          ProductRepository
        >
    with $Provider<ProductRepository> {
  ProductRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProductRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductRepository create(Ref ref) {
    return productRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductRepository>(value),
    );
  }
}

String _$productRepositoryHash() => r'0f6b0819da4efe4066045b0593d230f235fc35d3';

@ProviderFor(cartRepository)
final cartRepositoryProvider = CartRepositoryProvider._();

final class CartRepositoryProvider
    extends $FunctionalProvider<CartRepository, CartRepository, CartRepository>
    with $Provider<CartRepository> {
  CartRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartRepositoryHash();

  @$internal
  @override
  $ProviderElement<CartRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CartRepository create(Ref ref) {
    return cartRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CartRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CartRepository>(value),
    );
  }
}

String _$cartRepositoryHash() => r'4219980ed3b5e38b62b7e5a6dbb26c388b1b2f84';

@ProviderFor(product)
final productProvider = ProductFamily._();

final class ProductProvider
    extends
        $FunctionalProvider<AsyncValue<Product?>, Product?, Stream<Product?>>
    with $FutureModifier<Product?>, $StreamProvider<Product?> {
  ProductProvider._({
    required ProductFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productHash();

  @override
  String toString() {
    return r'productProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Product?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Product?> create(Ref ref) {
    final argument = this.argument as String;
    return product(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productHash() => r'2ed16f8fc2a75d756100d104bdac9c2cd410abf8';

final class ProductFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Product?>, String> {
  ProductFamily._()
    : super(
        retry: null,
        name: r'productProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductProvider call(String id) =>
      ProductProvider._(argument: id, from: this);

  @override
  String toString() => r'productProvider';
}

@ProviderFor(cartLines)
final cartLinesProvider = CartLinesProvider._();

final class CartLinesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CartLine>>,
          List<CartLine>,
          Stream<List<CartLine>>
        >
    with $FutureModifier<List<CartLine>>, $StreamProvider<List<CartLine>> {
  CartLinesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartLinesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartLinesHash();

  @$internal
  @override
  $StreamProviderElement<List<CartLine>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<CartLine>> create(Ref ref) {
    return cartLines(ref);
  }
}

String _$cartLinesHash() => r'8ab85814607ae3531659dab7390ddbc010e7df8a';
