import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

/// Soft pink-to-white gradient behind the sign-in and registration screens.
class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.gradientTop, AppColors.gradientBottom],
        ),
      ),
      child: SizedBox.expand(child: child),
    );
  }
}
