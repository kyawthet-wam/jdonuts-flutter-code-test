import 'package:flutter/material.dart';

/// Shield silhouette filled with a two-tone gradient for a loyalty tier.
class TierShieldPainter extends CustomPainter {
  const TierShieldPainter({required this.light, required this.dark});

  final Color light;
  final Color dark;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path()
      ..moveTo(w * 0.5, 0)
      ..quadraticBezierTo(w * 0.75, h * 0.1, w, h * 0.12)
      ..lineTo(w, h * 0.55)
      ..quadraticBezierTo(w * 0.95, h * 0.85, w * 0.5, h)
      ..quadraticBezierTo(w * 0.05, h * 0.85, 0, h * 0.55)
      ..lineTo(0, h * 0.12)
      ..quadraticBezierTo(w * 0.25, h * 0.1, w * 0.5, 0)
      ..close();
    canvas.drawPath(
      path,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [light, dark],
        ).createShader(Offset.zero & size),
    );
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = w * 0.04
        ..color = Colors.white.withValues(alpha: 0.6),
    );
  }

  @override
  bool shouldRepaint(TierShieldPainter old) =>
      old.light != light || old.dark != dark;
}
