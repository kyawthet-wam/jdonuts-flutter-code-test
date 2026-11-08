import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/presentation/widgets/placeholder_sheet.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/generated/app_localizations.dart';

/// "By continuing, you agree to our Terms of Use and Privacy Policy".
/// Both links open a placeholder sheet (no real documents in the demo).
class LegalFooter extends HookWidget {
  const LegalFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final terms = useMemoized(TapGestureRecognizer.new);
    final privacy = useMemoized(TapGestureRecognizer.new);
    useEffect(
      () => () {
        terms.dispose();
        privacy.dispose();
      },
      const [],
    );
    terms.onTap = () => showPlaceholderSheet(context, l10n.termsOfUse);
    privacy.onTap = () => showPlaceholderSheet(context, l10n.privacyPolicy);

    const link = TextStyle(
      color: AppColors.accent,
      fontWeight: FontWeight.w700,
    );
    return Text.rich(
      TextSpan(
        style: AppTypography.caption,
        children: [
          TextSpan(text: l10n.legalPrefix),
          TextSpan(text: l10n.termsOfUse, style: link, recognizer: terms),
          TextSpan(text: l10n.legalAnd),
          TextSpan(text: l10n.privacyPolicy, style: link, recognizer: privacy),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
