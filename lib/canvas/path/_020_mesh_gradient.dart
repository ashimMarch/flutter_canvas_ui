// ignore_for_file: avoid_print, unused_local_variable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_canvas/main.dart';

class MeshGradient extends StatelessWidget {
  const MeshGradient({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 450),
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

    canvas.drawVertices(
      Vertices(
        VertexMode.triangleFan, 
        [Offset.zero, Offset(size.width, 0), Offset(size.width, size.height), Offset(0, size.height)],
        colors: [Colors.red, Colors.blue, Colors.pink, Colors.green]
      ),
      BlendMode.src,
      red,
    );
  }

  @override
  bool shouldRepaint(_QuadraticBezierToPainter oldDelegate) {
    return false;
  }
}

const redColor = Color(0xFFFF0000);
const white = Colors.white;
const indigoColor = Colors.indigo;
