part of '../rewards_screen.dart';

/// Ring that sweeps from 0 to the member's tier progress while the total
/// counts up from 0, both driven by one eased value.
class _PointsRing extends StatelessWidget {
  const _PointsRing({required this.member});

  final Member member;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: DelayedProgress(
        delay: AppMotion.stagger,
        duration: AppMotion.ringSweep,
        builder: (context, value) => Stack(
          alignment: Alignment.center,
          children: [
            RepaintBoundary(
              child: CustomPaint(
                size: Size.infinite,
                painter: PointsRingPainter(
                  progress: member.tierProgress * value,
                ),
              ),
            ),
            _RingLabel(points: (member.totalPoints * value).round()),
          ],
        ),
      ),
    );
  }
}

class _RingLabel extends StatelessWidget {
  const _RingLabel({required this.points});

  final int points;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.totalPoints,
              style: AppTypography.caption.copyWith(
                color: AppColors.accent,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              formatThousands(context, points),
              style: AppTypography.title.copyWith(color: AppColors.accent),
            ),
          ],
        ),
      ),
    );
  }
}
