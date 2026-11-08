/// Why a phone number was rejected.
enum PhoneError { empty, invalidFormat }

extension PhoneErrorX on PhoneError {
  bool get isEmpty => this == PhoneError.empty;
  bool get isInvalidFormat => this == PhoneError.invalidFormat;
}

/// Myanmar country calling code shown as the fixed field prefix.
const String myanmarDialCode = '+95';

const int _minSubscriberDigits = 7;
const int _maxSubscriberDigits = 9;

/// Matches a Myanmar mobile number once the leading zero is removed: a 9
/// followed by 7 to 9 more digits.
final RegExp _nationalNumber =
    RegExp('^9\\d{$_minSubscriberDigits,$_maxSubscriberDigits}\$');

/// Strips spaces, dashes and one leading zero so users can type the number
/// the way they write it locally (`09 254-135 592`).
String normalizePhoneInput(String raw) {
  final compact = raw.replaceAll(RegExp(r'[\s\-]'), '');
  return compact.startsWith('0') ? compact.substring(1) : compact;
}

/// Returns null when [raw] is a valid number, otherwise the reason.
PhoneError? validatePhone(String raw) {
  if (raw.trim().isEmpty) return PhoneError.empty;
  final national = normalizePhoneInput(raw);
  return _nationalNumber.hasMatch(national) ? null : PhoneError.invalidFormat;
}

/// E.164 form (`+959254135592`) for a number that already passed
/// [validatePhone]; null when it did not.
String? toE164(String raw) {
  if (validatePhone(raw) != null) return null;
  return '$myanmarDialCode${normalizePhoneInput(raw)}';
}
