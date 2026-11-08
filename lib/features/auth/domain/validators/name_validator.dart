/// Why a name was rejected.
enum NameError { empty, tooLong, invalidCharacters }

extension NameErrorX on NameError {
  bool get isEmpty => this == NameError.empty;
  bool get isTooLong => this == NameError.tooLong;
  bool get isInvalidCharacters => this == NameError.invalidCharacters;
}

const int maxNameLength = 50;

/// Letters (any script, so Myanmar works), combining marks such as Myanmar
/// vowel signs, and spaces. Digits and punctuation are rejected.
final RegExp _allowedName = RegExp(r'^[\p{L}\p{M} ]+$', unicode: true);

NameError? _validateCharacters(String trimmed) {
  if (trimmed.runes.length > maxNameLength) return NameError.tooLong;
  return _allowedName.hasMatch(trimmed) ? null : NameError.invalidCharacters;
}

/// First name is required.
NameError? validateFirstName(String raw) {
  final trimmed = raw.trim();
  if (trimmed.isEmpty) return NameError.empty;
  return _validateCharacters(trimmed);
}

/// Last name is optional: many Myanmar names have no family name.
NameError? validateLastName(String raw) {
  final trimmed = raw.trim();
  if (trimmed.isEmpty) return null;
  return _validateCharacters(trimmed);
}
