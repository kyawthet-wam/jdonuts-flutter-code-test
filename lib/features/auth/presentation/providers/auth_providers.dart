import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/result/result.dart';
import '../../../../core/storage/key_value_store.dart';
import '../../data/fake_auth_repository.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/entities/session_status.dart';
import '../../../../core/time/clock.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/use_cases/auth_use_cases.dart';

part 'auth_providers.g.dart';

/// Where accounts and the session are stored. Overridden in tests.
@Riverpod(keepAlive: true)
KeyValueStore keyValueStore(Ref ref) => const SecureKeyValueStore();

/// The auth backend. Swap this provider to move from the fake to a real API.
@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) =>
    FakeAuthRepository(ref.watch(keyValueStoreProvider));

@riverpod
RequestOtp requestOtp(Ref ref) => RequestOtp(ref.watch(authRepositoryProvider));

@riverpod
VerifyOtp verifyOtp(Ref ref) => VerifyOtp(ref.watch(authRepositoryProvider));

@riverpod
CompleteRegistration completeRegistration(Ref ref) => CompleteRegistration(
  ref.watch(authRepositoryProvider),
  ref.watch(clockProvider),
);

/// The signed-in user, restored from storage on launch.
@Riverpod(keepAlive: true)
class SessionNotifier extends _$SessionNotifier {
  @override
  Future<AuthUser?> build() async {
    final restored = await ref.watch(authRepositoryProvider).restoreSession();
    return restored.when(ok: (user) => user, err: (failure) => throw failure);
  }

  /// Signs [user] in; the router reacts to the state change.
  Future<Result<void>> signIn(AuthUser user) async {
    final started = await ref.read(authRepositoryProvider).startSession(user);
    if (started.isOk) state = AsyncData(user);
    return started;
  }

  /// Clears the session; the redirect guard then returns to Onboarding.
  Future<Result<void>> signOut() async {
    final done = await ref.read(authRepositoryProvider).signOut();
    if (done.isOk) state = const AsyncData(null);
    return done;
  }
}

/// [SessionNotifier] reduced to what routing needs. A failed restore counts as
/// logged out so the user is never stuck on the splash screen.
@Riverpod(keepAlive: true)
SessionStatus sessionStatus(Ref ref) {
  final session = ref.watch(sessionProvider);
  if (session.isLoading && !session.hasValue) return SessionStatus.unknown;
  return session.value == null
      ? SessionStatus.loggedOut
      : SessionStatus.loggedIn;
}
