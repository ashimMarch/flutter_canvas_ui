// ignore_for_file: avoid_print, unused_local_variable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_canvas/main.dart';

class PathMatrics extends StatelessWidget {
  const PathMatrics({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 600),
      foregroundPainter: _QuadraticBezierToPainter(),
    );
  }
}

class _QuadraticBezierToPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint = PaintConst.grayFill;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), fillPaint);

    final paint = Paint()
      ..color = red
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 4,
    );

    final path = Path()
      ..addRect(Rect.fromCenter(
        center: Offset.zero,
        width: size.width / 4,
        height: size.height / 4,
      ))
      ..addOval(rect);
    final List<PathMetric> m = path.computeMetrics().toList();
    print(m.first.length); // Rectangle (300/4 = 75)*2 + (600/4 = 150)*2 = 450//
    print(m.last.length); // Circle 2 * pi * radius  : Circumference//

    final subPath = m.last.extractPath(60, 200);

    canvas.drawPath(
      path,  //subPath
      paint,
    );
  }

  @override
  bool shouldRepaint(_QuadraticBezierToPainter oldDelegate) {
    return true;
  }
}

const red = Color(0xFFFF0000);
const white = Colors.white;
