import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Thick glazed ring: a grey track and a pink arc (with white sprinkles) that
/// sweeps clockwise from the top up to [progress].
class PointsRingPainter extends CustomPainter {
  const PointsRingPainter({required this.progress});

  /// 0..1 share of the full circle that is filled.
  final double progress;

  static const double _strokeRatio = 0.2;
  static const int _sprinkleCount = 22;
  static const double _sprinkleLength = 0.045;
  static const double _startAngle = -math.pi / 2;

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = size.width * _strokeRatio;
    final rect = Offset.zero & size;
    final arcRect = rect.deflate(stroke / 2);
    _paintTrack(canvas, arcRect, stroke);
    if (progress <= 0) return;
    _paintGlaze(canvas, arcRect, stroke);
    _paintSprinkles(canvas, arcRect, stroke);
  }

  void _paintTrack(Canvas canvas, Rect arcRect, double stroke) {
    canvas.drawArc(
      arcRect,
      0,
      math.pi * 2,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..color = AppColors.surfaceMuted,
    );
  }

  void _paintGlaze(Canvas canvas, Rect arcRect, double stroke) {
    canvas.drawArc(
      arcRect,
      _startAngle,
      math.pi * 2 * progress,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..strokeCap = StrokeCap.round
        ..shader = const SweepGradient(
          startAngle: _startAngle,
          endAngle: _startAngle + math.pi * 2,
          colors: [AppColors.accent, AppColors.accentSoft, AppColors.accent],
          transform: GradientRotation(_startAngle),
        ).createShader(arcRect),
    );
  }

  /// Sprinkles sit at fixed angles and appear as the sweep reaches them.
  void _paintSprinkles(Canvas canvas, Rect arcRect, double stroke) {
    final center = arcRect.center;
    final radius = arcRect.width / 2;
    final paint = Paint()
      ..color = AppColors.surface
      ..strokeWidth = stroke * 0.09
      ..strokeCap = StrokeCap.round;
    final reach = math.pi * 2 * progress;
    for (var i = 0; i < _sprinkleCount; i++) {
      final along = (i + 0.5) / _sprinkleCount * math.pi * 2;
      if (along > reach - stroke / radius) continue;
      final offset = ((i * 7) % 5 - 2) * stroke * 0.14;
      final angle = _startAngle + along;
      final point =
          center + Offset(math.cos(angle), math.sin(angle)) * (radius + offset);
      final tilt = angle + (i.isEven ? 0.9 : -0.9);
      final d =
          Offset(math.cos(tilt), math.sin(tilt)) * stroke * _sprinkleLength * 3;
      canvas.drawLine(point - d, point + d, paint);
    }
  }

  @override
  bool shouldRepaint(PointsRingPainter old) => old.progress != progress;
}
