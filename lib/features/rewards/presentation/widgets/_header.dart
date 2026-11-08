part of '../rewards_screen.dart';

/// Title with the orange "Rewards (n)" badge, which pops in on entry.
class _Header extends StatelessWidget {
  const _Header({required this.count});

  /// Null while challenges load: the badge simply isn't shown yet.
  final int? count;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.screenGutter,
        AppSpacing.md,
        AppSpacing.screenGutter,
        0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(l10n.rewardsTitle, style: AppTypography.display),
          ),
          if (count != null) _RewardsBadge(count: count!),
        ],
      ),
    );
  }
}

class _RewardsBadge extends StatelessWidget {
  const _RewardsBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return DelayedProgress(
      duration: AppMotion.medium,
      curve: AppMotion.pop,
      builder: (context, value) => Transform.scale(
        scale: value,
        alignment: Alignment.topRight,
        child: Semantics(
          label: l10n.rewardsBadgeLabel(count),
          child: ExcludeSemantics(child: _BadgeBody(count: count)),
        ),
      ),
    );
  }
}

class _BadgeBody extends StatelessWidget {
  const _BadgeBody({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.promo,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context).rewardsBadge,
            style: AppTypography.subtitle.copyWith(
              color: AppColors.textOnPrimary,
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.surface,
              shape: BoxShape.circle,
            ),
            child: Text(
              '$count',
              style: AppTypography.caption.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
