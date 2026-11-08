import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../motion/app_motion.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';

const double _highlightWidth = 0.6;

/// Sweeps a soft highlight across [child] (use with [SkeletonBox]es).
///
/// Skipped entirely when the platform asks for reduced motion.
class Shimmer extends HookWidget {
  const Shimmer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.disableAnimationsOf(context);
    final controller = useAnimationController(duration: AppMotion.shimmer);
    useEffect(() {
      if (reduce) return null;
      controller.repeat();
      return controller.stop;
    }, [reduce]);
    if (reduce) return child;

    return AnimatedBuilder(
      animation: controller,
      child: child,
      builder: (context, child) => ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (bounds) =>
            _gradient(controller.value).createShader(bounds),
        child: child,
      ),
    );
  }

  LinearGradient _gradient(double t) {
    final start = -_highlightWidth + t * (1 + _highlightWidth * 2);
    return LinearGradient(
      begin: Alignment(-1 + start * 2, 0),
      end: Alignment(-1 + (start + _highlightWidth) * 2, 0),
      colors: [
        AppColors.surfaceMuted,
        AppColors.surface.withValues(alpha: 0.9),
        AppColors.surfaceMuted,
      ],
    );
  }
}

/// A grey rounded placeholder block.
class SkeletonBox extends StatelessWidget {
  const SkeletonBox({
    super.key,
    this.width,
    this.height,
    this.radius = AppRadius.md,
  });

  final double? width;
  final double? height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
