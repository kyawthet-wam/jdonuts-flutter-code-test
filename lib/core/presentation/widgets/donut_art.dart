import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

/// Flat illustrated donut drawn in code, used until photo assets are bundled
/// and as the placeholder art for the generated seed images.
class DonutArt extends StatelessWidget {
  const DonutArt({
    super.key,
    this.size = 120,
    this.icing = AppColors.accentSoft,
  });

  final double size;
  final Color icing;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        size: Size.square(size),
        painter: _DonutPainter(icing),
      ),
    );
  }
}

class _DonutPainter extends CustomPainter {
  const _DonutPainter(this.icing);

  final Color icing;

  static const double _holeRatio = 0.22;
  static const int _sprinkles = 14;
  static const double _golden = 2.399963; // radians, spreads sprinkles evenly

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final outer = size.width / 2;
    final dough = Paint()..color = AppColors.promo.withValues(alpha: 0.35);
    canvas.drawCircle(center, outer, dough);
    canvas.drawCircle(center, outer * 0.88, Paint()..color = icing);
    _paintSprinkles(canvas, center, outer);
    canvas.drawCircle(
      center,
      outer * _holeRatio,
      Paint()..color = AppColors.surface,
    );
  }

  void _paintSprinkles(Canvas canvas, Offset center, double outer) {
    final paint = Paint()
      ..color = AppColors.surface
      ..strokeWidth = outer * 0.05
      ..strokeCap = StrokeCap.round;
    for (var i = 0; i < _sprinkles; i++) {
      final angle = i * _golden;
      final radius = outer * (0.4 + 0.4 * ((i * 7) % 5) / 5);
      final p = center + Offset(math.cos(angle), math.sin(angle)) * radius;
      final d = Offset(math.cos(angle + 1), math.sin(angle + 1)) * outer * 0.06;
      canvas.drawLine(p - d, p + d, paint);
    }
  }

  @override
  bool shouldRepaint(_DonutPainter old) => old.icing != icing;
}
