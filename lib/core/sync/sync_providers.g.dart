// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Null when no server is configured, which makes sync a no-op.

@ProviderFor(remoteCatalogSource)
final remoteCatalogSourceProvider = RemoteCatalogSourceProvider._();

/// Null when no server is configured, which makes sync a no-op.

final class RemoteCatalogSourceProvider
    extends
        $FunctionalProvider<
          RemoteCatalogSource?,
          RemoteCatalogSource?,
          RemoteCatalogSource?
        >
    with $Provider<RemoteCatalogSource?> {
  /// Null when no server is configured, which makes sync a no-op.
  RemoteCatalogSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remoteCatalogSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$remoteCatalogSourceHash();

  @$internal
  @override
  $ProviderElement<RemoteCatalogSource?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RemoteCatalogSource? create(Ref ref) {
    return remoteCatalogSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RemoteCatalogSource? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RemoteCatalogSource?>(value),
    );
  }
}

String _$remoteCatalogSourceHash() =>
    r'5f2769fcfc407b50fd71696590e717d21106915c';

@ProviderFor(catalogSync)
final catalogSyncProvider = CatalogSyncProvider._();

final class CatalogSyncProvider
    extends $FunctionalProvider<CatalogSync, CatalogSync, CatalogSync>
    with $Provider<CatalogSync> {
  CatalogSyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'catalogSyncProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$catalogSyncHash();

  @$internal
  @override
  $ProviderElement<CatalogSync> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CatalogSync create(Ref ref) {
    return catalogSync(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CatalogSync value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CatalogSync>(value),
    );
  }
}

String _$catalogSyncHash() => r'87b1d2b6415d2c20a02faf20e2364f5eb1383048';

/// Starts a background refresh whenever the device comes back online (and on
/// launch if already online). Screens call [refresh] for pull-to-refresh.
///
/// Why state is the last result: a failed background sync is silent (the UI
/// keeps showing local data), but the failure stays inspectable.

@ProviderFor(SyncController)
final syncControllerProvider = SyncControllerProvider._();

/// Starts a background refresh whenever the device comes back online (and on
/// launch if already online). Screens call [refresh] for pull-to-refresh.
///
/// Why state is the last result: a failed background sync is silent (the UI
/// keeps showing local data), but the failure stays inspectable.
final class SyncControllerProvider
    extends $NotifierProvider<SyncController, Result<void>?> {
  /// Starts a background refresh whenever the device comes back online (and on
  /// launch if already online). Screens call [refresh] for pull-to-refresh.
  ///
  /// Why state is the last result: a failed background sync is silent (the UI
  /// keeps showing local data), but the failure stays inspectable.
  SyncControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncControllerHash();

  @$internal
  @override
  SyncController create() => SyncController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Result<void>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Result<void>?>(value),
    );
  }
}

String _$syncControllerHash() => r'09be6616dc43569ba40a9f818f7780b7524e3911';

/// Starts a background refresh whenever the device comes back online (and on
/// launch if already online). Screens call [refresh] for pull-to-refresh.
///
/// Why state is the last result: a failed background sync is silent (the UI
/// keeps showing local data), but the failure stays inspectable.

abstract class _$SyncController extends $Notifier<Result<void>?> {
  Result<void>? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Result<void>?, Result<void>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Result<void>?, Result<void>?>,
              Result<void>?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
