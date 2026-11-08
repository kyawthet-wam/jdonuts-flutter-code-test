/// Why a date of birth was rejected.
enum DateOfBirthError { incomplete, invalidDate, inFuture, tooYoung }

extension DateOfBirthErrorX on DateOfBirthError {
  bool get isIncomplete => this == DateOfBirthError.incomplete;
  bool get isInvalidDate => this == DateOfBirthError.invalidDate;
  bool get isInFuture => this == DateOfBirthError.inFuture;
  bool get isTooYoung => this == DateOfBirthError.tooYoung;
}

/// Youngest age allowed to register.
const int minimumRegistrationAge = 13;

/// Earliest year accepted, which also rejects typos like `80`.
const int earliestBirthYear = 1900;

/// Validates the three separate fields. Returns null when valid.
///
/// [now] is injected so the age rule is deterministic in tests.
DateOfBirthError? validateDateOfBirth({
  required int? year,
  required int? month,
  required int? day,
  required DateTime now,
}) {
  if (year == null || month == null || day == null) {
    return DateOfBirthError.incomplete;
  }
  final date = _realDateOrNull(year, month, day);
  if (date == null) return DateOfBirthError.invalidDate;
  final today = DateTime(now.year, now.month, now.day);
  if (date.isAfter(today)) return DateOfBirthError.inFuture;
  return _ageOn(today, date) < minimumRegistrationAge
      ? DateOfBirthError.tooYoung
      : null;
}

/// Builds the date only if every field survives unchanged. `DateTime`
/// silently rolls 31 April over to 1 May, so we compare the parts back.
DateTime? _realDateOrNull(int year, int month, int day) {
  if (year < earliestBirthYear) return null;
  final date = DateTime(year, month, day);
  final unchanged = date.year == year && date.month == month && date.day == day;
  return unchanged ? date : null;
}

int _ageOn(DateTime today, DateTime birth) {
  final hadBirthday =
      today.month > birth.month ||
      (today.month == birth.month && today.day >= birth.day);
  return today.year - birth.year - (hadBirthday ? 0 : 1);
}
