import 'dart:math';
import 'package:flutter/material.dart';

class ProgressCustom extends CustomPainter {
  ProgressCustom({required this.valor});
  final int valor;
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint();
    paint1.color = Colors.purple;
    paint1.style = PaintingStyle.stroke;
    paint1.strokeWidth = 6;

    final paint2 = Paint();
    paint2.color = Colors.green;
    paint2.style = PaintingStyle.stroke;
    paint2.strokeWidth = 6;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.height / 2, paint1);

    final rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.height / 2);
    final startAngle = -pi / 2;
    double sweepAngle = pi * (valor/50);
    final useCenter = false;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
