import 'package:flutter/material.dart';
import 'package:my_canvas/main.dart';

class PolygonsFlutter extends StatelessWidget {
  const PolygonsFlutter({super.key});

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
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addPolygon(
        [
          Offset.zero,
          Offset(size.width / 2, 0),
          Offset(size.width / 2, size.height / 2),
          Offset(size.width, size.height / 2),
          Offset(size.width, size.height),
          Offset(0, size.height),


          // Offset(0, size.height*0.89),
          // Offset(size.width-size.height*0.1, size.height*0.89),
          // Offset(size.width-size.height*0.1, size.height/2+size.height*0.1),
          // Offset(size.width/2-size.height*0.1, size.height/2+size.height*0.1),
          // Offset(size.width/2-size.height*0.1, size.height*0.1),
          // Offset(50, size.height*0.1),
        ],
        false,
      );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_QuadraticBezierToPainter oldDelegate) {
    return true;
  }
}

const red = Color(0xFFFF0000);
const white = Colors.white;
