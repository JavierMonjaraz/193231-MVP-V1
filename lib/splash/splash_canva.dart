import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:mvp_all/styles/colors/colors_views.dart';

class SplashCanvas extends CustomPainter {
  final ui.Image? imageCanvas;

  const SplashCanvas(this.imageCanvas);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = ColorsViews.splashbg;

    paint.style = PaintingStyle.fill;

    final path = Path();
    final path_2 = Path();

    path.lineTo(0, size.height * 0.1);
    path.quadraticBezierTo(size.width * 0.15, size.height * 0.18,size.width * 0.35, size.height * 0.13);
    path.quadraticBezierTo(size.width * 0.55, size.height * 0.07,size.width * 0.8, size.height * 0.1);
    path.quadraticBezierTo(size.width * 0.98, size.height * 0.13, size.width, size.height * 0.12);
    path.lineTo(size.width, size.height * 0.08);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);

    path_2.lineTo(0, size.height);
    path_2.quadraticBezierTo(size.width * 0.75, size.height * 0.75, size.width, size.height);
    path_2.lineTo(0, size.height);

    canvas.drawPath(path_2, paint);

    canvas.scale(0.28, 0.28);
    // print(imageCanvas!.height);

    canvas.drawImage(imageCanvas!, const Offset(120 * 2.5, 320 * 2.5), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}