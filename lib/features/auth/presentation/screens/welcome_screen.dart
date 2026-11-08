import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/presentation/widgets/auth_background.dart';
import '../../../../core/presentation/widgets/donut_art.dart';
import '../../../../core/presentation/widgets/drift_in.dart';
import '../../../../core/presentation/widgets/staggered_entrance.dart';
import '../../../../core/presentation/widgets/primary_button.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../providers/registration_flow.dart';

/// Shown once after registration. Tapping "Let's explore" starts the session.
class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final busy = ref.watch(registrationFlowProvider.select((s) => s.isBusy));

    Future<void> explore() async {
      final result = await ref
          .read(registrationFlowProvider.notifier)
          .startExploring();
      if (!context.mounted) return;
      if (result.isOk) {
        context.go(AppRoutes.home);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l10n.genericError)));
      }
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
                const Expanded(child: _Tiles()),
                // After the four tiles have slid in, the title fades up.
                StaggeredEntrance(
                  index: _tileCount + 1,
                  child: Text(
                    l10n.welcomeTitle,
                    style: AppTypography.display,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                StaggeredEntrance(
                  index: _tileCount + 2,
                  child: PrimaryButton(
                    label: l10n.letsExplore,
                    onPressed: explore,
                    isLoading: busy,
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const int _tileCount = 4;
const double _tileTravel = 70;
const List<Color> _tileColors = [
  AppColors.accentSoft,
  AppColors.primary,
  AppColors.tierGold,
  AppColors.tierPlatinum,
];

/// Donut tiles slide in from alternating sides, one after another.
class _Tiles extends StatelessWidget {
  const _Tiles();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: AppSpacing.md,
        runSpacing: AppSpacing.md,
        children: [
          for (final (i, color) in _tileColors.indexed)
            DriftIn(
              index: i,
              from: Offset(i.isEven ? -_tileTravel : _tileTravel, 0),
              child: _Tile(color),
            ),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile(this.icing);

  final Color icing;

  static const double _size = 130;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: icing.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Center(
        child: DonutArt(size: _size * 0.7, icing: icing),
      ),
    );
  }
}
