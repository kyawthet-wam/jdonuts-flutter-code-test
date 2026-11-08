import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../connectivity/connectivity_providers.dart';
import '../../motion/app_motion.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';

/// Shows a small banner above [child] while the device is offline.
///
/// While the banner is visible it covers the status bar area, so the top
/// safe-area inset is removed from [child] to avoid padding twice.
class OfflineBannerLayout extends ConsumerWidget {
  const OfflineBannerLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Assume online until the first check completes: no flash on launch.
    final online = ref.watch(isOnlineProvider).value ?? true;
    return Column(
      children: [
        AnimatedSize(
          duration: AppMotion.resolve(context, AppMotion.medium),
          curve: AppMotion.standard,
          child: online
              ? const SizedBox(width: double.infinity)
              : const _Banner(),
        ),
        Expanded(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: !online,
            child: child,
          ),
        ),
      ],
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner();

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;
    return Container(
      width: double.infinity,
      color: AppColors.textPrimary,
      padding: EdgeInsets.fromLTRB(
        AppSpacing.md,
        topInset + AppSpacing.xxs,
        AppSpacing.md,
        AppSpacing.xxs,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.wifi_off, size: 14, color: AppColors.textOnPrimary),
          const SizedBox(width: AppSpacing.xs),
          Flexible(
            child: Text(
              AppLocalizations.of(context).offlineBanner,
              style: AppTypography.caption.copyWith(
                color: AppColors.textOnPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
