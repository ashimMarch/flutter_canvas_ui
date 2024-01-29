// ignore_for_file: avoid_print, unused_local_variable

import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class DrawImageInCanvas extends StatefulWidget {
  const DrawImageInCanvas({super.key});

  @override
  State<DrawImageInCanvas> createState() => _DrawImageInCanvasState();
}

const imagePath1 = 'assets/img1.png';
const imagePath2 = 'assets/img2.jpg';

class _DrawImageInCanvasState extends State<DrawImageInCanvas> {
  final ValueNotifier<ui.Image?> imageNotifier = ValueNotifier(null);
  getImage() {
    AssetImage img = const AssetImage(imagePath1);
    ImageStream imgStream = img.resolve(ImageConfiguration.empty);
    ImageStreamListener imageStreamListener =
        ImageStreamListener((image, synchronousCall) {
      imageNotifier.value = image.image;
    });
    imgStream.addListener(imageStreamListener);
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 450),
      foregroundPainter: ImagePainter(
        imageNotifier: imageNotifier,
      ),
    );
  }
}

class ImagePainter extends CustomPainter {
  ImagePainter({required this.imageNotifier}) : super(repaint: imageNotifier);
  final ValueNotifier<ui.Image?> imageNotifier;

  @override
  void paint(Canvas canvas, Size size) {
    // final fillPaint = PaintConst.grayFill;
    // canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), fillPaint);

    final paint = Paint()
      ..color = redColor
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    ui.Image? img = imageNotifier.value;
    if (img != null) {
      final imgSize = Size(img.width.toDouble(), img.height.toDouble());
      // canvas.drawImage(img, Offset.zero, paint);
      final imgRect = Offset.zero & imgSize;
      final canvasRect = Offset.zero & size;
      canvas.drawImageRect(img, imgRect, canvasRect, paint);
    }
  }

  @override
  bool shouldRepaint(ImagePainter oldDelegate) {
    return false;
  }
}

const redColor = Color(0xFFFF0000);
const white = Colors.white;
const indigoColor = Colors.indigo;
