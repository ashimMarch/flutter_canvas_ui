// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:my_canvas/main.dart';

class Combining extends StatelessWidget {
  const Combining({super.key});
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
      ..style = PaintingStyle.fill;
    final rect1 = Rect.fromCircle(
      center: Offset(
        (size.width / 2) + (size.width / 8),
        size.height / 2,
      ),
      radius: size.width / 4,
    );
    final rect2 = Rect.fromCircle(
      center: Offset(
        (size.width / 2) - (size.width / 8),
        size.height / 2,
      ),
      radius: size.width / 4,
    );
    final path1 = Path()..addOval(rect1);
    final path2 = Path()..addOval(rect2);
    // canvas.drawPath(path1, red);
    // canvas.drawPath(path2, red);

    // canvas.drawPath(Path.combine(PathOperation.intersect, path1, path2), red);
    canvas.drawPath(Path.combine(PathOperation.difference, path1, path2), red);
    // canvas.drawPath(Path.combine(PathOperation.reverseDifference, path1, path2), red);
    // canvas.drawPath(Path.combine(PathOperation.xor, path1, path2), red);
  }

  @override
  bool shouldRepaint(_QuadraticBezierToPainter oldDelegate) {
    return false;
  }
}

const redColor = Color(0xFFFF0000);
const white = Colors.white;
const indigoColor = Colors.indigo;
