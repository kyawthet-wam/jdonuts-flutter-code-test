import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/motion/app_motion.dart';
import '../../../../core/theme/app_colors.dart';

/// Registration progress at the top-right of each step.
///
/// The ring sweeps from the previous step's fill to this step's fill; at 100%
/// it morphs into a check badge. Each step is its own route, so the previous
/// fill is derived from [step] instead of kept in state.
class StepProgressRing extends StatelessWidget {
  const StepProgressRing({super.key, required this.step, this.totalSteps = 4});

  final int step;
  final int totalSteps;

  static const double size = 28;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Step $step of $totalSteps',
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: (step - 1) / totalSteps, end: step / totalSteps),
        duration: AppMotion.resolve(context, AppMotion.slow),
        curve: AppMotion.standard,
        builder: (context, progress, _) => AnimatedSwitcher(
          duration: AppMotion.resolve(context, AppMotion.medium),
          switchInCurve: AppMotion.pop,
          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),
          child: progress >= 1
              ? const _CheckBadge(key: ValueKey('check'))
              : RepaintBoundary(
                  key: const ValueKey('ring'),
                  child: CustomPaint(
                    size: const Size.square(size),
                    painter: _RingPainter(progress),
                  ),
                ),
        ),
      ),
    );
  }
}

class _CheckBadge extends StatelessWidget {
  const _CheckBadge({super.key});

  static const double _iconSize = 16;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: StepProgressRing.size,
      height: StepProgressRing.size,
      decoration: const BoxDecoration(
        color: AppColors.accent,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.check,
        color: AppColors.textOnPrimary,
        size: _iconSize,
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter(this.progress);

  final double progress;

  static const double _stroke = 5;
  static const double _trackAlpha = 0.35;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final arcRect = rect.deflate(_stroke / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = _stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      arcRect,
      0,
      math.pi * 2,
      false,
      paint..color = AppColors.primary.withValues(alpha: _trackAlpha),
    );
    canvas.drawArc(
      arcRect,
      -math.pi / 2,
      math.pi * 2 * progress,
      false,
      paint..color = AppColors.accent,
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.progress != progress;
}
