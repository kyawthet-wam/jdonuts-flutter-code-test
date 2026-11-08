import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../motion/app_motion.dart';

/// Horizontal shared-axis transition: the new step slides in from the right
/// while the previous one drifts left and fades.
CustomTransitionPage<void> stepPage(
  BuildContext context,
  GoRouterState state,
  Widget child,
) {
  final duration = AppMotion.resolve(context, AppMotion.stepTransition);
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final incoming = CurvedAnimation(
        parent: animation,
        curve: AppMotion.standard,
      );
      final outgoing = CurvedAnimation(
        parent: secondaryAnimation,
        curve: AppMotion.standard,
      );
      return SlideTransition(
        position: Tween(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(incoming),
        child: SlideTransition(
          position: Tween(
            begin: Offset.zero,
            end: const Offset(-0.3, 0),
          ).animate(outgoing),
          child: FadeTransition(
            opacity: Tween<double>(begin: 1, end: 0).animate(outgoing),
            child: child,
          ),
        ),
      );
    },
  );
}

/// Cross-fade used for splash and welcome, which aren't steps in a sequence.
CustomTransitionPage<void> fadePage(
  BuildContext context,
  GoRouterState state,
  Widget child,
) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: AppMotion.resolve(context, AppMotion.slow),
    transitionsBuilder: (context, animation, _, child) => FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: AppMotion.standard),
      child: child,
    ),
  );
}
