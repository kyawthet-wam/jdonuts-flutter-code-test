import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Donut that colours in quarter by quarter.
///
/// [quarters] runs 0..4 (fractions allowed, so it can animate smoothly): the
/// first quarter fills the top-right wedge, then clockwise. Unfilled wedges
/// stay a pale grey so the goal is visible from the start.
class DonutQuartersPainter extends CustomPainter {
  const DonutQuartersPainter({required this.quarters});

  final double quarters;

  static const int _total = 4;
  static const double _holeRatio = 0.24;
  static const double _startAngle = -math.pi / 2;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2;
    _paintDonut(canvas, center, radius, colored: false);
    for (var q = 0; q < _total; q++) {
      final fill = (quarters - q).clamp(0.0, 1.0);
      if (fill > 0) _paintWedge(canvas, center, radius, q, fill);
    }
  }

  void _paintWedge(Canvas canvas, Offset c, double r, int q, double fill) {
    const quarter = math.pi / 2;
    final wedge = Path()
      ..moveTo(c.dx, c.dy)
      ..arcTo(
        Rect.fromCircle(center: c, radius: r * 1.2),
        _startAngle + quarter * q,
        quarter * fill,
        false,
      )
      ..close();
    canvas
      ..save()
      ..clipPath(wedge);
    _paintDonut(canvas, c, r, colored: true);
    canvas.restore();
  }

  void _paintDonut(Canvas canvas, Offset c, double r, {required bool colored}) {
    canvas
      ..drawCircle(
        c,
        r,
        Paint()
          ..color = colored ? const Color(0xFFF2B87C) : AppColors.surfaceMuted,
      )
      ..drawCircle(
        c,
        r * 0.86,
        Paint()
          ..color = colored ? AppColors.accentSoft : const Color(0xFFF7F7F8),
      );
    _paintSprinkles(canvas, c, r, colored);
    canvas.drawCircle(c, r * _holeRatio, Paint()..color = AppColors.surface);
  }

  void _paintSprinkles(Canvas canvas, Offset c, double r, bool colored) {
    final paint = Paint()
      ..color = colored ? AppColors.surface : AppColors.border
      ..strokeWidth = r * 0.05
      ..strokeCap = StrokeCap.round;
    for (var i = 0; i < 16; i++) {
      final a = i * 2.39996;
      final d = r * (0.42 + 0.4 * ((i * 7) % 5) / 5);
      final p = c + Offset(math.cos(a), math.sin(a)) * d;
      final t = Offset(math.cos(a + 1), math.sin(a + 1)) * r * 0.07;
      canvas.drawLine(p - t, p + t, paint);
    }
  }

  @override
  bool shouldRepaint(DonutQuartersPainter old) => old.quarters != quarters;
}

/// Open arc over a coffee cup that fills to [progress] (e.g. 9/12 = 0.75).
class CoffeeArcPainter extends CustomPainter {
  const CoffeeArcPainter({required this.progress});

  final double progress;

  static const double _strokeRatio = 0.09;
  static const double _start = math.pi * 0.85;
  static const double _span = math.pi * 1.3;

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = size.width * _strokeRatio;
    final rect = (Offset.zero & size).deflate(stroke / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;
    canvas
      ..drawArc(
        rect,
        _start,
        _span,
        false,
        paint..color = AppColors.surfaceMuted,
      )
      ..drawArc(
        rect,
        _start,
        _span * progress,
        false,
        paint..color = AppColors.promo,
      );
  }

  @override
  bool shouldRepaint(CoffeeArcPainter old) => old.progress != progress;
}
