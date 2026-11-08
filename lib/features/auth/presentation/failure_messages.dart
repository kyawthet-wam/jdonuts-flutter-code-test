import '../../../core/result/failure.dart';
import '../../../l10n/generated/app_localizations.dart';

/// Turns a typed failure into text the user can act on. Domain failures hold
/// no UI strings, so all wording lives in the ARB files.
String failureMessage(AppLocalizations l10n, Failure failure) {
  return switch (failure) {
    AuthFailure(reason: final r) when r.isUserNotFound => l10n.notRegistered,
    _ => l10n.genericError,
  };
}
