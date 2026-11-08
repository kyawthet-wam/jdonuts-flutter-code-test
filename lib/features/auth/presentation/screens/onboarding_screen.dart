import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/presentation/widgets/auth_background.dart';
import '../../../../core/presentation/widgets/donut_art.dart';
import '../../../../core/presentation/widgets/placeholder_sheet.dart';
import '../../../../core/presentation/widgets/press_scale.dart';
import '../../../../core/presentation/widgets/primary_button.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/repositories/auth_repository.dart';
import '../providers/registration_flow.dart';
import '../widgets/legal_footer.dart';

/// First screen for logged-out users: register, log in or social placeholders.
class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    void begin(AuthIntent intent) {
      ref.read(registrationFlowProvider.notifier).start(intent);
      context.push(AppRoutes.phone);
    }

    return Scaffold(
      body: AuthBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenGutter,
            ),
            child: Column(
              children: [
                const Expanded(child: _Hero()),
                Text(
                  l10n.onboardingTitle,
                  style: AppTypography.display,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.lg),
                PrimaryButton(
                  label: l10n.letsGetStarted,
                  onPressed: () => begin(AuthIntent.register),
                ),
                const SizedBox(height: AppSpacing.md),
                _LoginRow(onLogin: () => begin(AuthIntent.login)),
                const SizedBox(height: AppSpacing.md),
                const _SocialRow(),
                const SizedBox(height: AppSpacing.lg),
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

class _Hero extends StatelessWidget {
  const _Hero();

  @override
  Widget build(BuildContext context) {
    return const Center(child: DonutArt(size: 220));
  }
}

class _LoginRow extends StatelessWidget {
  const _LoginRow({required this.onLogin});

  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(l10n.alreadyHaveAccount, style: AppTypography.caption),
        GestureDetector(
          onTap: onLogin,
          child: Text(
            l10n.logIn,
            style: AppTypography.caption.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

const double _iconSize = 24;

/// Google, Apple and Facebook: no real integration, each opens a sheet.
class _SocialRow extends StatelessWidget {
  const _SocialRow();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialButton(
          label: l10n.continueWithGoogle,
          child: SvgPicture.asset('assets/icons/google.svg', width: _iconSize),
        ),
        _SocialButton(
          label: l10n.continueWithApple,
          child: const Icon(
            Icons.apple,
            color: AppColors.textPrimary,
            size: _iconSize + AppSpacing.xxs,
          ),
        ),
        _SocialButton(
          label: l10n.continueWithFacebook,
          child: SvgPicture.asset(
            'assets/icons/facebook.svg',
            width: _iconSize,
          ),
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      child: Semantics(
        button: true,
        label: label,
        child: PressScale(
          onTap: () => showPlaceholderSheet(context, label),
          child: SizedBox.square(
            dimension: AppSizes.iconButton + AppSpacing.xs,
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
