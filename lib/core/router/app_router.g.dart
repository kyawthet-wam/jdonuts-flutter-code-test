// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The one router instance.
///
/// Why keepAlive and a ValueNotifier: rebuilding the router on every session
/// change would reset the navigation stack. Instead the session status feeds
/// `refreshListenable`, which only re-runs the redirect.

@ProviderFor(appRouter)
final appRouterProvider = AppRouterProvider._();

/// The one router instance.
///
/// Why keepAlive and a ValueNotifier: rebuilding the router on every session
/// change would reset the navigation stack. Instead the session status feeds
/// `refreshListenable`, which only re-runs the redirect.

final class AppRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// The one router instance.
  ///
  /// Why keepAlive and a ValueNotifier: rebuilding the router on every session
  /// change would reset the navigation stack. Instead the session status feeds
  /// `refreshListenable`, which only re-runs the redirect.
  AppRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRouterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return appRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$appRouterHash() => r'457c66bbeb83dc4280fad3f3f92e898bb508e856';
