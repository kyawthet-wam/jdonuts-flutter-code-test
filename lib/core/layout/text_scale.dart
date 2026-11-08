import 'package:flutter/widgets.dart';

extension TextScaleLayout on BuildContext {
  /// Grows a design height with the user's text size.
  ///
  /// Why: cards with fixed heights overflow when text is scaled up (the brief
  /// requires up to 1.3x). Never shrinks below the designed [base] height.
  double scaledHeight(double base) {
    final factor = MediaQuery.textScalerOf(this).scale(1);
    return base * (factor < 1 ? 1 : factor);
  }
}
