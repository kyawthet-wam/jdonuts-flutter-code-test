// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The single SQLite database, closed when the container is disposed.

@ProviderFor(appDatabase)
final appDatabaseProvider = AppDatabaseProvider._();

/// The single SQLite database, closed when the container is disposed.

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  /// The single SQLite database, closed when the container is disposed.
  AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'448c9bfb2c0f94483c904cb00d38b91081c53fa8';

/// Completes once the bundled seed is in the database (a no-op after the
/// first launch). Anything reading catalog data awaits this first.

@ProviderFor(databaseSeed)
final databaseSeedProvider = DatabaseSeedProvider._();

/// Completes once the bundled seed is in the database (a no-op after the
/// first launch). Anything reading catalog data awaits this first.

final class DatabaseSeedProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// Completes once the bundled seed is in the database (a no-op after the
  /// first launch). Anything reading catalog data awaits this first.
  DatabaseSeedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseSeedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseSeedHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return databaseSeed(ref);
  }
}

String _$databaseSeedHash() => r'3860079dfede6f8581f0d306f7fb00b4748086c5';
