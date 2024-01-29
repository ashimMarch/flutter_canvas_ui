// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:my_canvas/main.dart';

class ShiftingPath extends StatelessWidget {
  const ShiftingPath({super.key});

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
    final indigo = Paint()
      ..color = indigoColor
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 4,
    );

    final path = Path()..addRect(rect);
    canvas.drawPath(path, red);
    path.reset();
    path.addOval(rect);

    final translatedPath = path.shift(
      Offset(
        size.width / 4,
        0,
      ),
    );
    canvas.drawPath(translatedPath, indigo);
  }

  @override
  bool shouldRepaint(_QuadraticBezierToPainter oldDelegate) {
    return true;
  }
}

const redColor = Color(0xFFFF0000);
const white = Colors.white;
const indigoColor = Colors.indigo;
