part of '../rewards_screen.dart';

const List<MemberTier> _ladderTiers = [
  MemberTier.silver,
  MemberTier.gold,
  MemberTier.platinum,
];

const double _badgeWidth = 40;
const double _badgeHeight = 46;
const double _connectorHeight = 48;
const double _connectorWidth = 3;

/// Silver, Gold and Platinum appear one after another; the current tier is
/// highlighted and the line towards the next tier fills to show progress.
class _TierLadder extends StatelessWidget {
  const _TierLadder({required this.member});

  final Member member;

  /// Share of the line below [tier] that is filled.
  double _fillBelow(MemberTier tier) {
    if (member.tier.index > tier.index) return 1;
    return member.tier == tier ? member.tierProgress : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final (i, tier) in _ladderTiers.indexed) ...[
          StaggeredEntrance(
            index: i,
            child: _TierRow(tier: tier, member: member),
          ),
          if (i < _ladderTiers.length - 1)
            _Connector(fill: _fillBelow(tier), delay: AppMotion.stagger * 3),
        ],
      ],
    );
  }
}

class _TierRow extends StatelessWidget {
  const _TierRow({required this.tier, required this.member});

  final MemberTier tier;
  final Member member;

  bool get _isCurrent => tier == member.tier;

  String _status(AppLocalizations l10n, BuildContext context) {
    if (_isCurrent) return l10n.tierHere;
    if (tier.index < member.tier.index) return l10n.tierAchieved;
    if (tier == member.tier.next) {
      final points = formatThousands(context, member.pointsToNextTier);
      return l10n.tierRemaining(points, tier.label(l10n));
    }
    return l10n.tierSoon;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TierBadge(tier: tier, highlighted: _isCurrent),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tier.label(l10n),
                style: AppTypography.subtitle.copyWith(
                  fontWeight: _isCurrent ? FontWeight.w800 : FontWeight.w600,
                ),
              ),
              Text(_status(l10n, context), style: AppTypography.caption),
            ],
          ),
        ),
      ],
    );
  }
}

class _TierBadge extends StatelessWidget {
  const _TierBadge({required this.tier, required this.highlighted});

  final MemberTier tier;
  final bool highlighted;

  Color get _base => switch (tier) {
    MemberTier.gold => AppColors.tierGold,
    MemberTier.platinum => AppColors.tierPlatinum,
    MemberTier.bronze => AppColors.tierBronze,
    MemberTier.silver => AppColors.tierSilver,
  };

  @override
  Widget build(BuildContext context) {
    final light = Color.lerp(_base, AppColors.surface, 0.55)!;
    return AnimatedScale(
      scale: highlighted ? 1.12 : 1,
      duration: AppMotion.resolve(context, AppMotion.medium),
      curve: AppMotion.pop,
      child: Container(
        width: _badgeWidth,
        height: _badgeHeight,
        decoration: highlighted
            ? BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.35),
                    blurRadius: 14,
                  ),
                ],
              )
            : null,
        child: CustomPaint(
          painter: TierShieldPainter(light: light, dark: _base),
          child: Center(
            child: Text(
              tier.name[0].toUpperCase(),
              style: AppTypography.subtitle.copyWith(
                color: AppColors.surface,
                shadows: const [Shadow(color: AppColors.shadow, blurRadius: 2)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Vertical line between two tiers; the dark part grows to [fill].
class _Connector extends StatelessWidget {
  const _Connector({required this.fill, required this.delay});

  final double fill;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: (_badgeWidth - _connectorWidth) / 2),
      child: DelayedProgress(
        delay: delay,
        duration: AppMotion.ringSweep,
        builder: (context, value) => SizedBox(
          width: _connectorWidth,
          height: context.scaledHeight(_connectorHeight),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.surfaceMuted,
              borderRadius: BorderRadius.circular(AppRadius.pill),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: FractionallySizedBox(
                heightFactor: fill * value,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.textSecondary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppRadius.pill),
                    ),
                  ),
                  child: SizedBox(width: double.infinity),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
