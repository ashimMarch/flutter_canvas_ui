// ignore_for_file: avoid_print, unused_local_variable, unused_import

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_canvas/main.dart';

class DrawPointss extends StatelessWidget {
  const DrawPointss({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 450),
      foregroundPainter: _QuadraticBezierToPainter(),
    );
  }
}

class _QuadraticBezierToPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // final fillPaint = PaintConst.grayFill;
    // canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), fillPaint);

    final red = Paint()
      ..color = redColor
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;
    final List<Offset> points = [
      Offset.zero,
      Offset(size.width, 0),
      Offset(size.width / 2, size.height / 2),
      // Offset(0, size.height / 20),
    ];

    canvas.drawPoints(PointMode.points, points, red);
    // canvas.drawPoints(PointMode.polygon, points, red);
    // canvas.drawPoints(PointMode.lines, points, red);
  }

  @override
  bool shouldRepaint(_QuadraticBezierToPainter oldDelegate) {
    return false;
  }
}

const redColor = Color(0xFFFF0000);
const white = Colors.white;
const indigoColor = Colors.indigo;
