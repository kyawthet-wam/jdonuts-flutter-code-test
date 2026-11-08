import 'package:flutter/widgets.dart';

/// All animation durations and curves live here so the motion language can be
/// tuned in one place.
abstract final class AppMotion {
  // Durations
  static const Duration instant = Duration(milliseconds: 90);
  static const Duration fast = Duration(milliseconds: 180);
  static const Duration medium = Duration(milliseconds: 320);
  static const Duration slow = Duration(milliseconds: 600);
  static const Duration hero = Duration(milliseconds: 450);
  static const Duration ringSweep = Duration(milliseconds: 1400);
  static const Duration stepTransition = Duration(milliseconds: 380);
  static const Duration shake = Duration(milliseconds: 420);
  static const Duration shimmer = Duration(milliseconds: 1300);
  static const Duration bannerAutoPlay = Duration(seconds: 4);
  static const Duration attentionPulse = Duration(milliseconds: 900);

  /// Delay between consecutive items of a staggered entrance.
  static const Duration stagger = Duration(milliseconds: 70);

  // Curves
  static const Curve standard = Curves.easeOutCubic;
  static const Curve emphasized = Curves.easeInOutCubicEmphasized;
  static const Curve spring = Curves.elasticOut;
  static const Curve pop = Curves.easeOutBack;

  // Scales and distances
  static const double pressedScale = 0.96;
  static const double entranceSlide = 24;

  /// Returns [d] unless the platform asked for reduced motion.
  ///
  /// Why: honouring `disableAnimations` is an accessibility requirement, and
  /// centralising it avoids repeating the check at every call site.
  static Duration resolve(BuildContext context, Duration d) =>
      MediaQuery.disableAnimationsOf(context) ? Duration.zero : d;
}
