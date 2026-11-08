part of '../rewards_screen.dart';

const double _artSize = 100;
const String _coffeeAsset = 'assets/images/coffee_americano.png';
const double _coffeeCupShare = 0.6;

/// One challenge: progress artwork, title, "current/target" and Earn.
class _ChallengeCard extends StatelessWidget {
  const _ChallengeCard({required this.challenge, required this.index});

  final Challenge challenge;
  final int index;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Row(
        children: [
          _ChallengeArt(challenge: challenge, index: index),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(challenge.title, style: AppTypography.title),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  l10n.challengeProgress(challenge.current, challenge.target),
                  style: AppTypography.body,
                ),
                const SizedBox(height: AppSpacing.sm),
                _EarnRow(challenge: challenge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EarnRow extends StatelessWidget {
  const _EarnRow({required this.challenge});

  final Challenge challenge;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final points = formatThousands(context, challenge.rewardPoints);
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: AppSpacing.sm,
      children: [
        _EarnButton(challenge: challenge),
        Text(l10n.rewardPoints(points), style: AppTypography.body),
      ],
    );
  }
}

/// Progress artwork painted from the challenge's own numbers: the donut
/// colours in by quarters, the coffee arc fills to current/target.
class _ChallengeArt extends StatelessWidget {
  const _ChallengeArt({required this.challenge, required this.index});

  final Challenge challenge;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: _artSize,
      child: RepaintBoundary(
        child: DelayedProgress(
          delay: AppMotion.stagger * (index + 2),
          duration: AppMotion.ringSweep,
          builder: (context, value) => challenge.kind.isCoffee
              ? _CoffeeArt(progress: challenge.progress * value)
              : CustomPaint(
                  painter: DonutQuartersPainter(
                    quarters: challenge.progress * 4 * value,
                  ),
                ),
        ),
      ),
    );
  }
}

class _CoffeeArt extends StatelessWidget {
  const _CoffeeArt({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        FractionallySizedBox(
          widthFactor: _coffeeCupShare,
          heightFactor: _coffeeCupShare,
          child: Image.asset(_coffeeAsset, fit: BoxFit.contain),
        ),
        CustomPaint(
          size: Size.infinite,
          painter: CoffeeArcPainter(progress: progress),
        ),
      ],
    );
  }
}
