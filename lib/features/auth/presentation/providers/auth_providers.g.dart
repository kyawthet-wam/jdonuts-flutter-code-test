// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Where accounts and the session are stored. Overridden in tests.

@ProviderFor(keyValueStore)
final keyValueStoreProvider = KeyValueStoreProvider._();

/// Where accounts and the session are stored. Overridden in tests.

final class KeyValueStoreProvider
    extends $FunctionalProvider<KeyValueStore, KeyValueStore, KeyValueStore>
    with $Provider<KeyValueStore> {
  /// Where accounts and the session are stored. Overridden in tests.
  KeyValueStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'keyValueStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$keyValueStoreHash();

  @$internal
  @override
  $ProviderElement<KeyValueStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  KeyValueStore create(Ref ref) {
    return keyValueStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(KeyValueStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<KeyValueStore>(value),
    );
  }
}

String _$keyValueStoreHash() => r'8fefb9c73cced671900c3c7e25088db33c596f9b';

/// The auth backend. Swap this provider to move from the fake to a real API.

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

/// The auth backend. Swap this provider to move from the fake to a real API.

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  /// The auth backend. Swap this provider to move from the fake to a real API.
  AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'ef79ffc6b088d8d1cda6c1dbff7f4346ea1c1c9a';

/// The signed-in user, restored from storage on launch.

@ProviderFor(SessionNotifier)
final sessionProvider = SessionNotifierProvider._();

/// The signed-in user, restored from storage on launch.
final class SessionNotifierProvider
    extends $AsyncNotifierProvider<SessionNotifier, AuthUser?> {
  /// The signed-in user, restored from storage on launch.
  SessionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionNotifierHash();

  @$internal
  @override
  SessionNotifier create() => SessionNotifier();
}

String _$sessionNotifierHash() => r'97989fb207aaa6bfe8b6882fae14722bacf72bd3';

/// The signed-in user, restored from storage on launch.

abstract class _$SessionNotifier extends $AsyncNotifier<AuthUser?> {
  FutureOr<AuthUser?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AuthUser?>, AuthUser?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AuthUser?>, AuthUser?>,
              AsyncValue<AuthUser?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// [SessionNotifier] reduced to what routing needs. A failed restore counts as
/// logged out so the user is never stuck on the splash screen.

@ProviderFor(sessionStatus)
final sessionStatusProvider = SessionStatusProvider._();

/// [SessionNotifier] reduced to what routing needs. A failed restore counts as
/// logged out so the user is never stuck on the splash screen.

final class SessionStatusProvider
    extends $FunctionalProvider<SessionStatus, SessionStatus, SessionStatus>
    with $Provider<SessionStatus> {
  /// [SessionNotifier] reduced to what routing needs. A failed restore counts as
  /// logged out so the user is never stuck on the splash screen.
  SessionStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionStatusProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionStatusHash();

  @$internal
  @override
  $ProviderElement<SessionStatus> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SessionStatus create(Ref ref) {
    return sessionStatus(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SessionStatus>(value),
    );
  }
}

String _$sessionStatusHash() => r'9d8d85846072e880423eae4695d6e1d1cc31a9f7';
