// ignore_for_file: avoid_print
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_canvas/main.dart';

class TransFormPath extends StatefulWidget {
  const TransFormPath({super.key});

  @override
  State<TransFormPath> createState() => _TransFormPathState();
}

class _TransFormPathState extends State<TransFormPath>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final AnimationController aaa =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    final Animation<double> an = Tween<double>(begin: 0, end: 2*pi).animate(aaa);
    aaa..forward()..repeat();
    return CustomPaint(
      size: const Size(300, 600),
      foregroundPainter: _QuadraticBezierToPainter(d: an),
    );
  }
}

class _QuadraticBezierToPainter extends CustomPainter {
  final Animation<double> d;
 
  _QuadraticBezierToPainter({required this.d}) : super(repaint: d);
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

    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width / 2,
      height: size.height / 3,
    );

    final path = Path()..addRect(rect);
    canvas.drawPath(path, red);

    Matrix4 transformation = Matrix4.identity();
    transformation.rotateX(d.value);

    final transformPath = path.transform(transformation.storage);
    canvas.drawPath(transformPath, indigo);
  }

  @override
  bool shouldRepaint(_QuadraticBezierToPainter oldDelegate) {
    return true;
  }
}

const redColor = Color(0xFFFF0000);
const white = Colors.white;
const indigoColor = Colors.indigo;
