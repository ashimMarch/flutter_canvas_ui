// ignore_for_file: avoid_print, unused_local_variable

import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class DrawParagraphInCustomPaint extends StatelessWidget {
  const DrawParagraphInCustomPaint({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 450),
      foregroundPainter: ParagraphPainter(),
    );
  }
}

class ParagraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    ui.ParagraphStyle paragraphStyle =
        ui.ParagraphStyle(fontSize: 20, fontWeight: FontWeight.bold);

    ui.TextStyle textStyle = ui.TextStyle(color: Colors.purple);
    ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(paragraphStyle);
    paragraphBuilder.pushStyle(textStyle);
    paragraphBuilder.addText('Hello Flutter Developers \n\nWELCOME');
    ui.Paragraph paragraph = paragraphBuilder.build();
    paragraph.layout(ui.ParagraphConstraints(width: size.width));

    canvas.drawParagraph(paragraph, Offset.zero);
  }

  @override
  bool shouldRepaint(ParagraphPainter oldDelegate) {
    return false;
  }
}

const redColor = Color(0xFFFF0000);
const white = Colors.white;
const indigoColor = Colors.indigo;
