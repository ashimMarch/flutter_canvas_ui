// ignore_for_file: unused_local_variable

import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:my_canvas/assets.dart';
import 'package:my_canvas/context_ext.dart';

class PLaceImgInsideText extends StatefulWidget {
  const PLaceImgInsideText({super.key});

  @override
  State<PLaceImgInsideText> createState() => _PLaceImgInsideTextState();
}

class _PLaceImgInsideTextState extends State<PLaceImgInsideText> {
  ValueNotifier<ImageInfo?> imageInfoNotifier = ValueNotifier(null);

  getImage() {
    AssetImage assetsImage = const AssetImage(AssetPath.comic);
    ImageStream imageStrean = assetsImage.resolve(ImageConfiguration.empty);
    ImageStreamListener imageStreamListener =
        ImageStreamListener((image, synchronousCall) {
      imageInfoNotifier.value = image;
    });
    imageStrean.addListener(imageStreamListener);
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder(
          valueListenable: imageInfoNotifier,
          builder: (_, imageInfo, __) {
            if (imageInfo != null) {
              ui.Image image = imageInfo.image;
              print(context.mqWidth / image.width);
              Matrix4 matrix4 = Matrix4.identity()
                ..scale(context.mqWidth / image.width);
              Float64List float64list = matrix4.storage;
              TileMode tileModeX = TileMode.repeated;
              TileMode tileModeY = TileMode.repeated;
              return Text(
                'Hello\nWorld',
                style: TextStyle(
                  fontSize: 150,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = ImageShader(
                      image,
                      tileModeX,
                      tileModeY,
                      float64list,
                    ),
                ),
              );
            }
            return const CircularProgressIndicator();
          }),
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
  }

  @override
  bool shouldRepaint(ClipLayers oldDelegate) => false;
}
