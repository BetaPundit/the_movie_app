import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomBlobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1
    Paint paintFill0 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paintFill0.shader = ui.Gradient.linear(
      Offset(size.width * 0.50, size.height * 0.00),
      Offset(size.width * 1.00, size.height * 1.00),
      [const Color.fromARGB(30, 0, 0, 0), const Color.fromARGB(55, 0, 0, 0)],
      [0.00, 1.00],
    );

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0002353, size.height * 0.5002333);
    path_0.cubicTo(
        size.width * 0.0000588,
        size.height * 0.4203333,
        size.width * 0.0296588,
        size.height * 0.3361333,
        size.width * 0.0590588,
        size.height * 0.3345333);
    path_0.cubicTo(
        size.width * 0.1475412,
        size.height * 0.3345667,
        size.width * 0.3244941,
        size.height * 0.3347000,
        size.width * 0.4129647,
        size.height * 0.3347333);
    path_0.cubicTo(
        size.width * 0.4458118,
        size.height * 0.3332667,
        size.width * 0.4703765,
        size.height * 0.2659667,
        size.width * 0.4711294,
        size.height * 0.1675333);
    path_0.cubicTo(
        size.width * 0.4708471,
        size.height * 0.0808000,
        size.width * 0.4966235,
        size.height * 0.0018667,
        size.width * 0.5296471,
        size.height * 0.0000333);
    path_0.cubicTo(
        size.width * 0.6325882,
        size.height * 0.0004000,
        size.width * 0.8384706,
        size.height * 0.0011333,
        size.width * 0.9414118,
        size.height * 0.0015000);
    path_0.cubicTo(
        size.width * 0.9700588,
        size.height * 0.0012667,
        size.width * 0.9998706,
        size.height * 0.0846667,
        size.width * 0.9999529,
        size.height * 0.1675333);
    path_0.cubicTo(
        size.width * 1.0000235,
        size.height * 0.2508667,
        size.width * 1.0001647,
        size.height * 0.3508667,
        size.width * 1.0002353,
        size.height * 0.4342000);
    path_0.cubicTo(
        size.width * 0.9999294,
        size.height * 0.5132000,
        size.width * 0.9707176,
        size.height * 0.6005333,
        size.width * 0.9414118,
        size.height * 0.6008667);
    path_0.cubicTo(
        size.width * 0.9267059,
        size.height * 0.6008667,
        size.width * 0.9090588,
        size.height * 0.6008667,
        size.width * 0.8943529,
        size.height * 0.6008667);
    path_0.cubicTo(
        size.width * 0.8613294,
        size.height * 0.6029000,
        size.width * 0.8359882,
        size.height * 0.6901667,
        size.width * 0.8355294,
        size.height * 0.7867667);
    path_0.cubicTo(
        size.width * 0.8354353,
        size.height * 0.8928333,
        size.width * 0.8207059,
        size.height * 0.9908667,
        size.width * 0.7861176,
        size.height * 1.0008667);
    path_0.cubicTo(
        size.width * 0.6097176,
        size.height * 1.0010667,
        size.width * 0.2357294,
        size.height * 1.0015000,
        size.width * 0.0593176,
        size.height * 1.0017333);
    path_0.cubicTo(
        size.width * 0.0298235,
        size.height * 1.0003667,
        size.width * 0.0002000,
        size.height * 0.9162667,
        size.width * 0.0003529,
        size.height * 0.8347333);
    path_0.cubicTo(
        size.width * 0.0003176,
        size.height * 0.7511000,
        size.width * 0.0003176,
        size.height * 0.7511000,
        size.width * 0.0002353,
        size.height * 0.5002333);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1
    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(0, 0, 0, 0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
