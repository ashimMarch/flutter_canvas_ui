
import 'package:flutter/material.dart';
import 'package:my_canvas/context_ext.dart';

class ClipLayersScreen extends StatelessWidget {
  const ClipLayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ColoredBox(
        color: Colors.white10,
        child: CustomPaint(
          painter: ClipLayers(),
          size: Size(context.mqWidth * 0.65, context.mqWidth * 0.85),
        ),
      ),
    );
  }
}

class ClipLayers extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset canvasCenter = Offset(size.width / 2, size.height / 2);
    Rect rectCanvasSize = Offset.zero & size;
    Rect rectHalfCanvasSize = Offset.zero & size / 2;
    Paint paintBlack = Paint()..color = Colors.black;
    Paint paintBlue = Paint()..color = Colors.blue;

    //  cliping canvas
    // canvas.clipRect(rectHalfCanvasSize);
    // canvas.clipRRect(RRect.fromRectAndRadius(rectHalfCanvasSize, const Radius.circular(20)));
    // canvas.clipPath(Path()..addArc(rectHalfCanvasSize, pi / 10, pi / 2));
    canvas.clipPath(Path()..addOval(rectHalfCanvasSize));

    canvas.drawRect(rectCanvasSize, paintBlack);
    canvas.drawPath(
      Path()
        ..addOval(
          Rect.fromCenter(center: canvasCenter, width: 100, height: 100),
        ),
      paintBlue,
    );
  }

  @override
  bool shouldRepaint(ClipLayers oldDelegate) => false;
}
