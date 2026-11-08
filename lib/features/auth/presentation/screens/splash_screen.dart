import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/auth_background.dart';
import '../../../../core/presentation/widgets/donut_art.dart';

/// Shown while the stored session is read on launch.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthBackground(child: Center(child: DonutArt(size: 140))),
    );
  }
}
