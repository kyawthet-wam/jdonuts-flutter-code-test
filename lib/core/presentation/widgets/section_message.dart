import 'package:flutter/material.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';

/// Per-section error with a retry. A failing section never blanks the screen.
class SectionError extends StatelessWidget {
  const SectionError({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return _MessageCard(
      icon: Icons.error_outline,
      text: l10n.sectionError,
      action: TextButton(onPressed: onRetry, child: Text(l10n.tryAgain)),
    );
  }
}

/// Per-section empty state.
class SectionEmpty extends StatelessWidget {
  const SectionEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return _MessageCard(
      icon: Icons.inbox_outlined,
      text: AppLocalizations.of(context).sectionEmpty,
    );
  }
}

class _MessageCard extends StatelessWidget {
  const _MessageCard({required this.icon, required this.text, this.action});

  final IconData icon;
  final String text;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.screenGutter),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.textHint),
          const SizedBox(height: AppSpacing.xs),
          Text(text, style: AppTypography.body, textAlign: TextAlign.center),
          ?action,
        ],
      ),
    );
  }
}
