import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/result/failure.dart';
import '../../../../core/result/result.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/validators/otp_validator.dart';
import 'auth_providers.dart';

part 'registration_flow.freezed.dart';
part 'registration_flow.g.dart';

/// Everything typed so far plus the request status.
///
/// Raw text is kept (not parsed values) so the back arrow restores fields
/// exactly as the user left them.
@freezed
abstract class RegistrationFlowState with _$RegistrationFlowState {
  const RegistrationFlowState._();

  const factory RegistrationFlowState({
    @Default(AuthIntent.register) AuthIntent intent,
    @Default('') String phoneInput,
    String? phoneE164,
    @Default('') String firstName,
    @Default('') String lastName,
    int? dobMonth,
    @Default('') String dobDay,
    @Default('') String dobYear,
    @Default(false) bool isBusy,
    @Default(0) int wrongOtpCount,
    AuthUser? registeredUser,
  }) = _RegistrationFlowState;

  /// True after [maxOtpAttempts] wrong codes, until a new code is requested.
  bool get isOtpLocked => wrongOtpCount >= maxOtpAttempts;

  int get otpAttemptsLeft => maxOtpAttempts - wrongOtpCount;
}

/// What happened when the user submitted a code.
enum OtpSubmitOutcome {
  continueRegistration,
  signedIn,
  wrong,
  locked,
  failed,

  /// A check was already running, so this submission was dropped.
  ignored,
}

extension OtpSubmitOutcomeX on OtpSubmitOutcome {
  bool get isContinueRegistration =>
      this == OtpSubmitOutcome.continueRegistration;
  bool get isSignedIn => this == OtpSubmitOutcome.signedIn;
  bool get isWrong => this == OtpSubmitOutcome.wrong;
  bool get isLocked => this == OtpSubmitOutcome.locked;
  bool get isFailed => this == OtpSubmitOutcome.failed;
  bool get isIgnored => this == OtpSubmitOutcome.ignored;
}

/// Drives login and registration across the step screens.
///
/// Why keepAlive: the state must survive navigating back and forth between
/// steps. Every action is ignored while [RegistrationFlowState.isBusy], which
/// is what makes a double tap send a single request.
@Riverpod(keepAlive: true)
class RegistrationFlow extends _$RegistrationFlow {
  @override
  RegistrationFlowState build() => const RegistrationFlowState();

  void start(AuthIntent intent) => state = RegistrationFlowState(
    intent: intent,
    phoneInput: state.phoneInput,
  );

  void updatePhone(String value) => state = state.copyWith(phoneInput: value);

  void updateName({String? first, String? last}) => state = state.copyWith(
    firstName: first ?? state.firstName,
    lastName: last ?? state.lastName,
  );

  void updateDob({int? month, String? day, String? year}) {
    state = state.copyWith(
      dobMonth: month ?? state.dobMonth,
      dobDay: day ?? state.dobDay,
      dobYear: year ?? state.dobYear,
    );
  }

  void reset() => state = const RegistrationFlowState();

  /// Sends the code for the typed phone number.
  Future<Result<void>> submitPhone() async {
    if (state.isBusy) return const Result.err(_busy);
    state = state.copyWith(isBusy: true);
    final result = await ref.read(requestOtpProvider)(
      state.phoneInput,
      state.intent,
    );
    state = state.copyWith(
      isBusy: false,
      phoneE164: result.valueOrNull ?? state.phoneE164,
      wrongOtpCount: result.isOk ? 0 : state.wrongOtpCount,
    );
    return result;
  }

  /// Asks for a fresh code, which also lifts the wrong-attempt lock.
  Future<Result<void>> resendOtp() => submitPhone();

  Future<OtpSubmitOutcome> submitOtp(String code) async {
    if (state.isBusy) return OtpSubmitOutcome.ignored;
    if (state.isOtpLocked) return OtpSubmitOutcome.locked;
    state = state.copyWith(isBusy: true);
    final result = await ref.read(verifyOtpProvider)(state.phoneE164!, code);
    final outcome = await _handleVerification(result);
    state = state.copyWith(isBusy: false);
    return outcome;
  }

  Future<OtpSubmitOutcome> _handleVerification(
    Result<OtpVerification> result,
  ) async {
    final failure = result.failureOrNull;
    if (failure is AuthFailure && failure.reason.isInvalidCode) {
      return _recordWrongCode();
    }
    if (failure != null) return OtpSubmitOutcome.failed;
    final existing = result.valueOrNull!.existingUser;
    if (state.intent.isLogin && existing != null) {
      await ref.read(sessionProvider.notifier).signIn(existing);
      return OtpSubmitOutcome.signedIn;
    }
    return OtpSubmitOutcome.continueRegistration;
  }

  OtpSubmitOutcome _recordWrongCode() {
    final count = state.wrongOtpCount + 1;
    state = state.copyWith(wrongOtpCount: count);
    return count >= maxOtpAttempts
        ? OtpSubmitOutcome.locked
        : OtpSubmitOutcome.wrong;
  }

  /// Creates the account from the collected fields.
  Future<Result<AuthUser>> submitProfile(DateTime dateOfBirth) async {
    if (state.isBusy) return const Result.err(_busy);
    state = state.copyWith(isBusy: true);
    final result = await ref.read(completeRegistrationProvider)(
      phoneE164: state.phoneE164!,
      firstName: state.firstName,
      lastName: state.lastName,
      dateOfBirth: dateOfBirth,
    );
    state = state.copyWith(
      isBusy: false,
      registeredUser: result.valueOrNull ?? state.registeredUser,
    );
    return result;
  }

  /// Welcome's "Let's explore": the new account becomes the session.
  Future<Result<void>> startExploring() async {
    final user = state.registeredUser;
    if (state.isBusy || user == null) return const Result.err(_busy);
    state = state.copyWith(isBusy: true);
    final result = await ref.read(sessionProvider.notifier).signIn(user);
    if (result.isOk) {
      reset();
    } else {
      state = state.copyWith(isBusy: false);
    }
    return result;
  }

  static const Failure _busy = UnknownFailure('Another request is running');
}
