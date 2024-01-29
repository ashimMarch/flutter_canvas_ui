// ignore_for_file: avoid_print, unused_local_variable
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_canvas/main.dart';

class ExtendsWidth extends StatelessWidget {
  const ExtendsWidth({super.key});
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

    final red = Paint()
      ..color = redColor
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;
    final path = Path()
      ..moveTo(0, size.height / 2)
      ..cubicTo(
        0,
        size.height / 8,
        size.width,
        size.height,
        size.width,
        size.height / 2,
      );
    final Matrix4 transformation = Matrix4.identity()..rotateY(pi / 4);
    path.extendWithPath(
      Path()..addRect(path.getBounds()),
      Offset.zero,
      // matrix4: transformation.storage,
    );
    canvas.drawPath(path, red);
  }

  @override
  bool shouldRepaint(_QuadraticBezierToPainter oldDelegate) {
    return false;
  }
}

const redColor = Color(0xFFFF0000);
const white = Colors.white;
const indigoColor = Colors.indigo;
