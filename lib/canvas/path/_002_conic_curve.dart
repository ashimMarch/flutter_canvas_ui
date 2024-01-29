import 'package:flutter/material.dart';
import 'package:my_canvas/main.dart';

class ConicToAndRelativeConicTo extends StatelessWidget {
  const ConicToAndRelativeConicTo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 600),
      foregroundPainter: _ConicToPainter(),
    );
  }
}

class _ConicToPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint = PaintConst.grayFill;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), fillPaint);
    /*
    conicTo(x1, y1, x2, y2, w)
    x1, y1 :  Controll point
    x2, y2 :  Ending point
    w : weight, If the weight is greater than 1, then the curve is a hyperbola; if the weight equals 1, it's a parabola; and if it is less than 1, it is an ellipse.
    */
    const red = Color(0xFFFF0000);
    final pathPaint = Paint()
      ..color = red
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    //  Parabola
    final parabola = Path()
      ..moveTo(0, size.height / 2)
      ..conicTo(size.width / 2, size.height, size.width, size.height / 2, 1);
    canvas.drawPath(parabola, pathPaint);

    //  Hyperbola
    final hyperbola = Path()
      ..moveTo(0, size.height / 2)
      ..conicTo(size.width / 2, size.height, size.width, size.height / 2, 0.5);
    canvas.drawPath(hyperbola, pathPaint..color = Colors.green);

    //  Ellipse  [With relative conicTo]
    final ellipse = Path()
      ..moveTo(0, size.height / 2)
      ..relativeConicTo(size.width / 2, -size.height / 2,   size.width, 0,   2);
    canvas.drawPath(ellipse, pathPaint..color = Colors.indigo);

    // final ellipse = Path()
    //   ..moveTo(0, size.height / 2)
    //   ..conicTo(size.width / 2, 0, size.width, size.height / 2, 0.5);
    // canvas.drawPath(ellipse, pathPaint..color = Colors.indigo);
  }

  @override
  bool shouldRepaint(_ConicToPainter oldDelegate) {
    return true;
  }
}
