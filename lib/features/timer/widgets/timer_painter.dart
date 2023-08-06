import 'dart:math';

import 'package:flutter/material.dart';

class TimerPainter extends CustomPainter {
  final Color color;
  final double endPoint;

  TimerPainter({
    required this.color,
    required this.endPoint,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final bgOffset = Offset(width / 2, height / 2);
    final bgRadius = width / 2;
    final bgPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawCircle(bgOffset, bgRadius, bgPaint);

    final arcRect = Rect.fromLTWH(0, 0, width, height);
    final arcPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(arcRect, 1 / 2 * pi * -1, endPoint * pi, false, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
