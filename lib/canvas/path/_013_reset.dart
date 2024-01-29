// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_canvas/main.dart';

class ResetAndUseSameInstanceOfPath extends StatelessWidget {
  const ResetAndUseSameInstanceOfPath({super.key});

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

    final paintRect = Paint()
      ..color = red
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;
    final paintCircle = Paint()
      ..color = indigo
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke;
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    final path = Path()
      ..addRect(
        rect,
      );

    canvas.drawPath(path, paintRect);

    path.reset();// it reset and draw only circle
    path.addOval(rect);
    canvas.drawPath(path, paintCircle);
  }

  @override
  bool shouldRepaint(_QuadraticBezierToPainter oldDelegate) {
    return true;
  }
}

const red = Color(0xFFFF0000);
const white = Colors.white;
const indigo = Colors.indigo;
