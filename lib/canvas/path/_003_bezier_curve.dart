import 'package:flutter/material.dart';
import 'package:my_canvas/main.dart';

class BezierToAndRelativeBezierTo extends StatelessWidget {
  const BezierToAndRelativeBezierTo({super.key});

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
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

      //   quadraticBezierTo, always create Parabola
    final bezier = Path()
      ..moveTo(0, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0.5, 0, size.width, size.height * 0.5);

    canvas.drawPath(bezier, paint);
    

    final relativeBezier = Path()
      ..moveTo(0, size.height * 0.5)
      ..relativeQuadraticBezierTo(size.width * 0.5, size.height*0.5, size.width, 0);

    canvas.drawPath(relativeBezier, paint..color = Colors.indigo);
  }

  @override
  bool shouldRepaint(_QuadraticBezierToPainter oldDelegate) {
    return true;
  }
}

const red = Color(0xFFFF0000);
