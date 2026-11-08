import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../motion/app_motion.dart';

/// Fades [child] in while it glides from [from] (logical pixels away from its
/// resting place) to where it belongs, after `index * stagger`.
///
/// Unlike `StaggeredEntrance` (a short upward nudge) this travels, which suits
/// decorative pieces such as the onboarding donuts. Under Reduce Motion the
/// child is simply shown in place.
class DriftIn extends HookWidget {
  const DriftIn({
    super.key,
    required this.index,
    required this.from,
    required this.child,
    this.duration = AppMotion.slow,
  });

  final int index;
  final Offset from;
  final Duration duration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.disableAnimationsOf(context);
    final controller = useAnimationController(
      duration: duration,
      initialValue: reduce ? 1 : 0,
    );
    useEffect(() {
      if (reduce) return null;
      final timer = Timer(AppMotion.stagger * index, controller.forward);
      return timer.cancel;
    }, const []);

    final curved = CurvedAnimation(
      parent: controller,
      curve: AppMotion.standard,
    );
    return FadeTransition(
      opacity: curved,
      child: AnimatedBuilder(
        animation: curved,
        child: child,
        builder: (context, child) => Transform.translate(
          offset: from * (1 - curved.value),
          child: child,
        ),
      ),
    );
  }
}
