import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

class CodePainter extends CustomPainter {
  // ********************************* VARS ******************************** //

  final double margin;
  final ui.Image qrImage;
  late Paint _paint;

  // ***************************** CONSTRUCTORS **************************** //

  CodePainter({required this.qrImage, this.margin = 10}) {
    _paint = Paint()
      ..color = Colors.white
      ..style = ui.PaintingStyle.fill;
  }

  //***************************** PUBLIC METHODS *************************** //

  @override
  void paint(Canvas canvas, Size size) {
    // Draw everything in white.
    final rect = Rect.fromPoints(Offset.zero, Offset(size.width, size.height));
    canvas.drawRect(rect, _paint);

    // Draw the image in the center.
    canvas.drawImage(qrImage, Offset(margin, margin), Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  ui.Picture toPicture(double size) {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    paint(canvas, Size(size, size));
    return recorder.endRecording();
  }

  Future<ui.Image> toImage(double size,
      {ui.ImageByteFormat format = ui.ImageByteFormat.png}) async {
    return await toPicture(size).toImage(size.toInt(), size.toInt());
  }

  Future<ByteData?> toImageData(double originalSize,
      {ui.ImageByteFormat format = ui.ImageByteFormat.png}) async {
    final image = await toImage(originalSize + margin * 2, format: format);
    return image.toByteData(format: format);
  }
}
