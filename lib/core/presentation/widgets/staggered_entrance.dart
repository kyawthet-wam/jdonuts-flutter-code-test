import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../motion/app_motion.dart';

/// Fades and slides [child] up once, starting after `index * stagger`, so
/// siblings appear one after another.
class StaggeredEntrance extends HookWidget {
  const StaggeredEntrance({
    super.key,
    required this.index,
    required this.child,
  });

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.disableAnimationsOf(context);
    final controller = useAnimationController(
      duration: AppMotion.medium,
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
          offset: Offset(0, (1 - curved.value) * AppMotion.entranceSlide),
          child: child,
        ),
      ),
    );
  }
}
