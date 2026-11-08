// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeRepository)
final homeRepositoryProvider = HomeRepositoryProvider._();

final class HomeRepositoryProvider
    extends $FunctionalProvider<HomeRepository, HomeRepository, HomeRepository>
    with $Provider<HomeRepository> {
  HomeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeRepositoryHash();

  @$internal
  @override
  $ProviderElement<HomeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeRepository create(Ref ref) {
    return homeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeRepository>(value),
    );
  }
}

String _$homeRepositoryHash() => r'38ada9b15b563ad25ab8bdfb2d3aa99da7dc30c5';

@ProviderFor(homeBanners)
final homeBannersProvider = HomeBannersProvider._();

final class HomeBannersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<HomeBanner>>,
          List<HomeBanner>,
          Stream<List<HomeBanner>>
        >
    with $FutureModifier<List<HomeBanner>>, $StreamProvider<List<HomeBanner>> {
  HomeBannersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeBannersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeBannersHash();

  @$internal
  @override
  $StreamProviderElement<List<HomeBanner>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<HomeBanner>> create(Ref ref) {
    return homeBanners(ref);
  }
}

String _$homeBannersHash() => r'49b1b70ef9a6f53ccf57097a91d0d3f7c6c7ad9a';

@ProviderFor(homeSections)
final homeSectionsProvider = HomeSectionsProvider._();

final class HomeSectionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProductSection>>,
          List<ProductSection>,
          Stream<List<ProductSection>>
        >
    with
        $FutureModifier<List<ProductSection>>,
        $StreamProvider<List<ProductSection>> {
  HomeSectionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeSectionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeSectionsHash();

  @$internal
  @override
  $StreamProviderElement<List<ProductSection>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ProductSection>> create(Ref ref) {
    return homeSections(ref);
  }
}

String _$homeSectionsHash() => r'efafde515a818accd5206da2972d02045970e94b';

@ProviderFor(homeShops)
final homeShopsProvider = HomeShopsProvider._();

final class HomeShopsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Shop>>,
          List<Shop>,
          Stream<List<Shop>>
        >
    with $FutureModifier<List<Shop>>, $StreamProvider<List<Shop>> {
  HomeShopsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeShopsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeShopsHash();

  @$internal
  @override
  $StreamProviderElement<List<Shop>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Shop>> create(Ref ref) {
    return homeShops(ref);
  }
}

String _$homeShopsHash() => r'391e9d40f25398b3bd3a65fa66be5f0e8324ddf6';
