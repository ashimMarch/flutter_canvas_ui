// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_canvas/main.dart';

class CalculatingAreaOfPath extends StatelessWidget {
  const CalculatingAreaOfPath({super.key});

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
    canvas.drawPath(path, red);

    final Rect rect = path.getBounds();
    print(rect);
    canvas.drawRect(rect, red);
  }

  @override
  bool shouldRepaint(_QuadraticBezierToPainter oldDelegate) {
    return false;
  }
}

const redColor = Color(0xFFFF0000);
const white = Colors.white;
const indigoColor = Colors.indigo;
