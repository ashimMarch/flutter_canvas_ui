// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:my_canvas/main.dart';

class ContainsMethod extends StatelessWidget {
  const ContainsMethod({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 600),
      foregroundPainter: _QuadraticBezierToPainter(),
    );
  }
}

//  Check whether a point is inside a path or outside a path
class _QuadraticBezierToPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint = PaintConst.grayFill;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), fillPaint);

    final red = Paint()
      ..color = redColor
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    final path = Path()
      ..addRect(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2,
        ),
      );
    final isContain = path.contains(
      // Offset.zero
      Offset(
        size.width / 2,
        size.height / 2,
      ),
    );
    print(isContain);

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
