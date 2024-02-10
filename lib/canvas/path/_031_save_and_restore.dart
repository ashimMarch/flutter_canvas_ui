// ignore_for_file: avoid_print, unused_local_variable, unused_import

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_canvas/main.dart';

class SaveAndRestoreCanvasScreen extends StatelessWidget {
  const SaveAndRestoreCanvasScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ColoredBox(
        color: Colors.grey,
        child: CustomPaint(
          size: const Size(300, 450),
          foregroundPainter: _SaveAndRestoreCanvas(),
        ),
      ),
    );
  }
}

class _SaveAndRestoreCanvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final red = Paint()..color = Colors.blue;
    final indigo = Paint()..color = Colors.amber;
    canvas.save();
    canvas.translate(20, 0);
    canvas.drawRect(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: 200,
          height: 200,
        ),
        red);

// only blue rect will translate
    canvas.restore();
    canvas.drawRect(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: 100,
          height: 100,
        ),
        indigo);
  }

  @override
  bool shouldRepaint(_SaveAndRestoreCanvas oldDelegate) {
    return false;
  }
}

const redColor = Color(0xFFFF0000);
const white = Colors.white;
const indigoColor = Colors.indigo;
