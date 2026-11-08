import '../../../../core/result/result.dart';
import '../entities/auth_user.dart';

/// Why the user is asking for a code: logging in requires an existing account.
enum AuthIntent { login, register }

extension AuthIntentX on AuthIntent {
  bool get isLogin => this == AuthIntent.login;
  bool get isRegister => this == AuthIntent.register;
}

/// Authentication contract. The UI depends only on this, so the fake
/// implementation can be replaced by a real API without touching screens.
abstract interface class AuthRepository {
  /// Sends a one-time code. For [AuthIntent.login] an unknown number fails
  /// with an `AuthFailure` whose reason is `userNotFound`.
  Future<Result<void>> requestOtp({
    required String phoneE164,
    required AuthIntent intent,
  });

  /// Checks [code]; a wrong code fails with reason `invalidCode`.
  Future<Result<OtpVerification>> verifyOtp({
    required String phoneE164,
    required String code,
  });

  /// Persists a new account but does not sign it in; the Welcome screen does
  /// that, so the redirect guard cannot skip it.
  Future<Result<AuthUser>> completeRegistration(RegistrationData data);

  /// Signs [user] in and stores the session.
  Future<Result<void>> startSession(AuthUser user);

  /// The signed-in user from a previous launch, or null when logged out.
  Future<Result<AuthUser?>> restoreSession();

  Future<Result<void>> signOut();
}
