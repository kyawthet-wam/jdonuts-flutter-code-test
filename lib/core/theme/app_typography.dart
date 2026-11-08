import 'package:flutter/painting.dart';

import 'app_colors.dart';

/// Type scale tokens. Font family is a single constant so swapping the brand
/// font is a one-line change.
abstract final class AppTypography {
  static const String? fontFamily = null;

  static const TextStyle display = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    height: 1.15,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
  );
  static const TextStyle title = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    height: 1.2,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
  );

  /// Heading of a content section ("Popular", "Seasonal specials").
  static const TextStyle sectionTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    height: 1.2,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
  );
  static const TextStyle subtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 1.3,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );
  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 1.4,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  /// Product name under a tile: clearly smaller than [sectionTitle].
  static const TextStyle productName = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 1.3,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 1.3,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
  static const TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    letterSpacing: 0.8,
    fontWeight: FontWeight.w800,
    color: AppColors.textOnPrimary,
  );
}
