import 'package:flutter/material.dart';

/// Crown glyph for the Reward tab (Material has no crown icon).
class CrownIcon extends StatelessWidget {
  const CrownIcon({super.key, required this.color, this.size = 24});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size.square(size), painter: _CrownPainter(color));
  }
}

class _CrownPainter extends CustomPainter {
  const _CrownPainter(this.color);

  final Color color;

  static const double _strokeRatio = 0.09;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path()
      ..moveTo(w * 0.12, h * 0.78)
      ..lineTo(w * 0.06, h * 0.28)
      ..lineTo(w * 0.32, h * 0.52)
      ..lineTo(w * 0.5, h * 0.18)
      ..lineTo(w * 0.68, h * 0.52)
      ..lineTo(w * 0.94, h * 0.28)
      ..lineTo(w * 0.88, h * 0.78)
      ..close();
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * _strokeRatio
      ..strokeJoin = StrokeJoin.round;
    canvas
      ..drawPath(path, paint)
      ..drawLine(
        Offset(w * 0.16, h * 0.9),
        Offset(w * 0.84, h * 0.9),
        paint..strokeCap = StrokeCap.round,
      );
  }

  @override
  bool shouldRepaint(_CrownPainter old) => old.color != color;
}
