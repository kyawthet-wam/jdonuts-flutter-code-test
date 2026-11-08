// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(rewardsRepository)
final rewardsRepositoryProvider = RewardsRepositoryProvider._();

final class RewardsRepositoryProvider
    extends
        $FunctionalProvider<
          RewardsRepository,
          RewardsRepository,
          RewardsRepository
        >
    with $Provider<RewardsRepository> {
  RewardsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rewardsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rewardsRepositoryHash();

  @$internal
  @override
  $ProviderElement<RewardsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RewardsRepository create(Ref ref) {
    return rewardsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RewardsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RewardsRepository>(value),
    );
  }
}

String _$rewardsRepositoryHash() => r'0ba7315b91aaedc5f36705c7587cdb3cb9b2fcec';

@ProviderFor(challenges)
final challengesProvider = ChallengesProvider._();

final class ChallengesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Challenge>>,
          List<Challenge>,
          Stream<List<Challenge>>
        >
    with $FutureModifier<List<Challenge>>, $StreamProvider<List<Challenge>> {
  ChallengesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'challengesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$challengesHash();

  @$internal
  @override
  $StreamProviderElement<List<Challenge>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Challenge>> create(Ref ref) {
    return challenges(ref);
  }
}

String _$challengesHash() => r'fc883e472bbe901d2bd7112a1315bc5d2d855ecb';
