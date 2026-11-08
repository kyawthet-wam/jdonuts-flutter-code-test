import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../motion/app_motion.dart';

/// Runs a 0 -> 1 animation once, after [delay], and rebuilds [builder] with
/// the eased value on every frame.
///
/// Used to choreograph entrances (ring sweep, line fill, progress art) from
/// one place. Under Reduce Motion it jumps straight to 1.
class DelayedProgress extends HookWidget {
  const DelayedProgress({
    super.key,
    required this.builder,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 600),
    this.curve = AppMotion.standard,
  });

  final Widget Function(BuildContext context, double value) builder;
  final Duration delay;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.disableAnimationsOf(context);
    final controller = useAnimationController(
      duration: duration,
      initialValue: reduce ? 1 : 0,
    );
    useEffect(() {
      if (reduce) return null;
      final timer = Timer(delay, controller.forward);
      return timer.cancel;
    }, const []);
    final value = useAnimation(
      CurvedAnimation(parent: controller, curve: curve),
    );
    return builder(context, value);
  }
}
