import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/auth_background.dart';
import '../../../../core/presentation/widgets/primary_button.dart';
import '../../../../core/presentation/widgets/round_back_button.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/generated/app_localizations.dart';
import 'legal_footer.dart';
import 'step_progress_ring.dart';

/// Layout shared by the four registration steps: back arrow and progress ring
/// on top, title, scrollable content, then Continue and the legal footer.
class AuthStepScaffold extends StatelessWidget {
  const AuthStepScaffold({
    super.key,
    required this.step,
    required this.title,
    required this.onBack,
    required this.onContinue,
    required this.isLoading,
    required this.child,
    this.subtitle,
  });

  final int step;
  final String title;
  final Widget? subtitle;
  final VoidCallback onBack;

  /// Null keeps Continue disabled.
  final VoidCallback? onContinue;
  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenGutter,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TopBar(step: step, onBack: onBack),
                const SizedBox(height: AppSpacing.lg),
                Text(title, style: AppTypography.display),
                if (subtitle != null) ...[
                  const SizedBox(height: AppSpacing.xs),
                  subtitle!,
                ],
                const SizedBox(height: AppSpacing.lg),
                Expanded(child: SingleChildScrollView(child: child)),
                PrimaryButton(
                  label: AppLocalizations.of(context).continueLabel,
                  onPressed: onContinue,
                  isLoading: isLoading,
                ),
                const SizedBox(height: AppSpacing.md),
                const LegalFooter(),
                const SizedBox(height: AppSpacing.md),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.step, required this.onBack});

  final int step;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundBackButton(onPressed: onBack),
          StepProgressRing(step: step),
        ],
      ),
    );
  }
}
