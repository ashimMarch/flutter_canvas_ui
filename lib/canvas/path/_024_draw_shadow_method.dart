// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter/material.dart';

class DrawShadowInCustomPaint extends StatelessWidget {
  const DrawShadowInCustomPaint({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 450),
      foregroundPainter: ShadowPainter(),
    );
  }
}

class ShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // final fillPaint = PaintConst.grayFill;
    // canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), fillPaint);

    final paint = Paint()
      ..color = redColor
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;

    final path = Path()
      ..addOval(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width / 2,
          height: size.height / 2,
        ),
      );

    canvas.drawShadow(path, Colors.white, 15, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(ShadowPainter oldDelegate) {
    return false;
  }
}

const redColor = Color(0xFFFF0000);
const white = Colors.white;
const indigoColor = Colors.indigo;
