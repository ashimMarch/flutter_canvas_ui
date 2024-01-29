// ignore_for_file: avoid_print, unused_local_variable

import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';

class DrawRawPointss extends StatelessWidget {
  const DrawRawPointss({super.key});
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
    final Float32List points = Float32List.fromList([
      0, 0,
      size.width, 0,
      size.width / 2, size.height / 2,
      0, 0,
    ]);


    canvas.drawRawPoints(PointMode.points, points, red);
  }

  @override
  bool shouldRepaint(_QuadraticBezierToPainter oldDelegate) {
    return false;
  }
}

const redColor = Color(0xFFFF0000);
const white = Colors.white;
const indigoColor = Colors.indigo;
