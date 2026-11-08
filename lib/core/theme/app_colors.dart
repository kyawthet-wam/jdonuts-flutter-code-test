import 'package:flutter/painting.dart';

/// Brand colour tokens, sampled from the design screens.
///
/// Widgets must read colours from here (or the theme), never hard-code them,
/// so a rebrand touches one file.
abstract final class AppColors {
  static const Color primary = Color(0xFF5BCFEB);
  static const Color primaryDark = Color(0xFF2FB4D6);
  static const Color accent = Color(0xFFEE5AA0);
  static const Color accentSoft = Color(0xFFF7A8CB);
  static const Color promo = Color(0xFFFF7A1A);

  static const Color textPrimary = Color(0xFF1F2430);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textHint = Color(0xFFA3A9B5);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceMuted = Color(0xFFF1F2F4);
  static const Color border = Color(0xFFE5E7EB);
  static const Color disabled = Color(0xFFE4E6EA);
  static const Color error = Color(0xFFE5484D);
  static const Color success = Color(0xFF2EB67D);

  static const Color gradientTop = Color(0xFFFCE4EC);
  static const Color gradientBottom = Color(0xFFFFFFFF);
  static const Color homeBackground = Color(0xFFFDE8D7);

  static const Color tierSilver = Color(0xFFB8BCC4);
  static const Color tierGold = Color(0xFFF2CE6B);
  static const Color tierPlatinum = Color(0xFFA9DDF0);
  static const Color tierBronze = Color(0xFFCD8A55);

  static const Color shadow = Color(0x1A000000);
}
