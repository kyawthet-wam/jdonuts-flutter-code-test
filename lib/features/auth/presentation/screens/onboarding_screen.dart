import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/presentation/widgets/auth_background.dart';
import '../../../../core/presentation/widgets/donut_art.dart';
import '../../../../core/presentation/widgets/drift_in.dart';
import '../../../../core/presentation/widgets/staggered_entrance.dart';
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
                StaggeredEntrance(
                  index: _heroCircles.length,
                  child: Text(
                    l10n.onboardingTitle,
                    style: AppTypography.display,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                StaggeredEntrance(
                  index: _heroCircles.length + 1,
                  child: PrimaryButton(
                    label: l10n.letsGetStarted,
                    onPressed: () => begin(AuthIntent.register),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                StaggeredEntrance(
                  index: _heroCircles.length + 2,
                  child: _LoginRow(onLogin: () => begin(AuthIntent.login)),
                ),
                const SizedBox(height: AppSpacing.md),
                StaggeredEntrance(
                  index: _heroCircles.length + 3,
                  child: const _SocialRow(),
                ),
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

/// One decorative circle: where it sits (alignment in the hero area), its
/// size as a share of the hero width, colours, and where it drifts in from.
typedef _HeroCircle = ({
  Alignment at,
  double size,
  Color background,
  Color icing,
  Offset from,
});

const List<_HeroCircle> _heroCircles = [
  (
    at: Alignment(-0.1, -0.1),
    size: 0.62,
    background: AppColors.accentSoft,
    icing: AppColors.accent,
    from: Offset(0, 60),
  ),
  (
    at: Alignment(-1.1, -0.8),
    size: 0.42,
    background: AppColors.primary,
    icing: AppColors.accentSoft,
    from: Offset(-90, -40),
  ),
  (
    at: Alignment(1.15, -0.55),
    size: 0.44,
    background: AppColors.tierGold,
    icing: AppColors.primary,
    from: Offset(90, -30),
  ),
  (
    at: Alignment(-0.95, 0.85),
    size: 0.4,
    background: AppColors.promo,
    icing: AppColors.accentSoft,
    from: Offset(-80, 60),
  ),
  (
    at: Alignment(1.0, 0.9),
    size: 0.38,
    background: AppColors.tierPlatinum,
    icing: AppColors.accent,
    from: Offset(80, 70),
  ),
];

/// Round food for every mood: donut circles that drift in one after another.
class _Hero extends StatelessWidget {
  const _Hero();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          for (final (i, c) in _heroCircles.indexed)
            Align(
              alignment: c.at,
              child: DriftIn(
                index: i,
                from: c.from,
                child: _DonutCircle(
                  diameter: constraints.maxWidth * c.size,
                  background: c.background,
                  icing: c.icing,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _DonutCircle extends StatelessWidget {
  const _DonutCircle({
    required this.diameter,
    required this.background,
    required this.icing,
  });

  final double diameter;
  final Color background;
  final Color icing;

  static const double _backgroundOpacity = 0.3;
  static const double _donutShare = 0.72;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: background.withValues(alpha: _backgroundOpacity),
        shape: BoxShape.circle,
      ),
      child: DonutArt(size: diameter * _donutShare, icing: icing),
    );
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
