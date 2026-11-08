part of '../rewards_screen.dart';

const double _earnWidth = 104;
const double _earnHeight = 40;
const double _pulseScale = 0.07;

/// Earn pill. Blue and pulsing a few times when the challenge is complete,
/// grey otherwise. Tapping gives press feedback but does nothing.
class _EarnButton extends HookWidget {
  const _EarnButton({required this.challenge});

  final Challenge challenge;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final active = challenge.isComplete;
    final reduce = MediaQuery.disableAnimationsOf(context);
    final pulse = useAnimationController(duration: AppMotion.attentionPulse);
    useEffect(() {
      if (!active || reduce) return null;
      unawaited(
        pulse.repeat(reverse: true, count: AppMotion.attentionPulseCycles * 2),
      );
      return pulse.stop;
    }, [active, reduce]);

    return Semantics(
      button: true,
      enabled: active,
      label: l10n.earnLabel(challenge.rewardPoints),
      child: ExcludeSemantics(
        child: AnimatedBuilder(
          animation: pulse,
          builder: (context, child) {
            final t = Curves.easeInOut.transform(pulse.value);
            return Transform.scale(scale: 1 + _pulseScale * t, child: child);
          },
          child: PressScale(
            onTap: () {},
            child: AnimatedContainer(
              duration: AppMotion.resolve(context, AppMotion.fast),
              width: _earnWidth,
              height: context.scaledHeight(_earnHeight),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: active ? AppColors.primary : AppColors.disabled,
                borderRadius: BorderRadius.circular(AppRadius.pill),
              ),
              child: Text(l10n.earn, style: AppTypography.button),
            ),
          ),
        ),
      ),
    );
  }
}
