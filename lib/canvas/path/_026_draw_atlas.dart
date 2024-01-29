import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class DrawAtlasInCustomPaint extends StatefulWidget {
  const DrawAtlasInCustomPaint({super.key});

  @override
  State<DrawAtlasInCustomPaint> createState() => _DrawAtlasInCustomPaintState();
}

const imagePath1 = 'assets/img1.png';
const imagePath2 = 'assets/img2.jpg';

class _DrawAtlasInCustomPaintState extends State<DrawAtlasInCustomPaint> {
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
      ..color = indigoColor
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;

      canvas.drawRect(Offset.zero & size, paint);
    ui.Image? img = imageNotifier.value;
    if (img != null) {
      List<RSTransform> transforms = [
        RSTransform.fromComponents(
            rotation: 0,
            scale: 1,
            anchorX: 10,
            anchorY: 0,
            translateX: 0,
            translateY: 0),
        RSTransform.fromComponents(
            rotation: 0,
            scale: 1.5,
            anchorX: 0,
            anchorY: 0,
            translateX: 100,
            translateY: 100),
        RSTransform.fromComponents(
            rotation: 0.28,
            scale: 1,
            anchorX: 0,
            anchorY: 0,
            translateX: 200,
            translateY: 300),
      ];

      List<Rect> rects = [
        const Rect.fromLTWH(0, 0, 100, 100),
        const Rect.fromLTWH(100, 100, 100, 100),
        const Rect.fromLTWH(200, 300, 100, 100),
      ];
      List<Color> colors = [
        Colors.white.withOpacity(0.5),
        Colors.red.withOpacity(0.5),
        Colors.blue.withOpacity(0.5),
      ];

      // canvas.drawAtlas(img, transforms, rects, null, null, null, paint);
      canvas.drawAtlas(img, transforms, rects, colors, BlendMode.plus, null, paint);
    }
  }

  @override
  bool shouldRepaint(ImagePainter oldDelegate) {
    return false;
  }
}

const redColor = Color(0xFFFF0000);
const white = Colors.white;
final indigoColor = Colors.indigo.shade900;
