/// Number of digits in a one-time code.
const int otpLength = 6;

/// Wrong attempts allowed before entry is locked until the user resends.
const int maxOtpAttempts = 3;

/// Why a code was rejected before it was even sent for verification.
enum OtpError { incomplete, notNumeric }

extension OtpErrorX on OtpError {
  bool get isIncomplete => this == OtpError.incomplete;
  bool get isNotNumeric => this == OtpError.notNumeric;
}

final RegExp _digitsOnly = RegExp(r'^\d+$');

/// Checks the shape of [code] only; whether it is *correct* is the
/// repository's decision.
OtpError? validateOtp(String code) {
  if (code.isNotEmpty && !_digitsOnly.hasMatch(code)) {
    return OtpError.notNumeric;
  }
  return code.length == otpLength ? null : OtpError.incomplete;
}

/// Keeps only digits and truncates to [otpLength], so pasting `12 34-56`
/// fills all six boxes.
String sanitizeOtpPaste(String pasted) {
  final digits = pasted.replaceAll(RegExp(r'\D'), '');
  return digits.length > otpLength ? digits.substring(0, otpLength) : digits;
}

/// How long before the code can be requested again.
const Duration otpResendCooldown = Duration(minutes: 5);
