import 'package:flutter/material.dart';

class BorderInside extends StatelessWidget {
  const BorderInside({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 600,
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: _CircleShapeBorder(),
      ),
      child: const Text('You have pushed the button this many times',style: TextStyle(color: Colors.white),),
    );
  }
}

class _CircleShapeBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsetsDirectional.all(25);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    final edgeInsets = dimensions.resolve(textDirection);
    final finalRect = edgeInsets.deflateRect(rect);
    return Path()..addRect(finalRect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRect(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.green
      ..strokeWidth = 2;

    canvas.drawPath(
        Path.combine(
          PathOperation.intersect,
          getOuterPath(rect, textDirection: textDirection),
          getInnerPath(rect, textDirection: textDirection),
        ),
        paint);
  }

  @override
  ShapeBorder scale(double t) {
    return const CircleBorder();
  }
}
