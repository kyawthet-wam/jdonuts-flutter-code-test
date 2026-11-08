// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(memberRepository)
final memberRepositoryProvider = MemberRepositoryProvider._();

final class MemberRepositoryProvider
    extends
        $FunctionalProvider<
          MemberRepository,
          MemberRepository,
          MemberRepository
        >
    with $Provider<MemberRepository> {
  MemberRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'memberRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$memberRepositoryHash();

  @$internal
  @override
  $ProviderElement<MemberRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MemberRepository create(Ref ref) {
    return memberRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MemberRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MemberRepository>(value),
    );
  }
}

String _$memberRepositoryHash() => r'7a9b10a2cd8c36613682e072a3f9d3730dc27a2f';

/// The one member record read by Home and Rewards.

@ProviderFor(member)
final memberProvider = MemberProvider._();

/// The one member record read by Home and Rewards.

final class MemberProvider
    extends $FunctionalProvider<AsyncValue<Member?>, Member?, Stream<Member?>>
    with $FutureModifier<Member?>, $StreamProvider<Member?> {
  /// The one member record read by Home and Rewards.
  MemberProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'memberProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$memberHash();

  @$internal
  @override
  $StreamProviderElement<Member?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Member?> create(Ref ref) {
    return member(ref);
  }
}

String _$memberHash() => r'2d8855666f4b372044e382dbbfccb8707c9090ad';
