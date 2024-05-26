import 'package:flutter/material.dart';

class CustomCardBgClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0003333, size.height * 0.1787857);
    path_0.cubicTo(
        size.width * -0.0003167,
        size.height * 0.1418000,
        size.width * 0.0416333,
        size.height * 0.1073143,
        size.width * 0.0837667,
        size.height * 0.1075000);
    path_0.cubicTo(
        size.width * 0.1722333,
        size.height * 0.1075429,
        size.width * 0.2953333,
        size.height * 0.1082714,
        size.width * 0.3837833,
        size.height * 0.1083000);
    path_0.cubicTo(
        size.width * 0.4331333,
        size.height * 0.1094857,
        size.width * 0.4656833,
        size.height * 0.0936571,
        size.width * 0.4666333,
        size.height * 0.0507143);
    path_0.cubicTo(
        size.width * 0.4667000,
        size.height * 0.0222571,
        size.width * 0.4908333,
        size.height * 0.0000429,
        size.width * 0.5333667,
        size.height * -0.0000857);
    path_0.cubicTo(
        size.width * 0.6363000,
        size.height * 0.0002857,
        size.width * 0.8136833,
        size.height * -0.0003143,
        size.width * 0.9166167,
        size.height * 0.0000571);
    path_0.cubicTo(
        size.width * 0.9584167,
        size.height * 0.0004429,
        size.width * 0.9993667,
        size.height * 0.0357000,
        size.width * 0.9999167,
        size.height * 0.0714286);
    path_0.cubicTo(
        size.width * 0.9999833,
        size.height * 0.1547714,
        size.width * 0.9999167,
        size.height * 0.7022714,
        size.width * 0.9999833,
        size.height * 0.7856286);
    path_0.cubicTo(
        size.width * 0.9994500,
        size.height * 0.8229714,
        size.width * 0.9598000,
        size.height * 0.8568857,
        size.width * 0.9169833,
        size.height * 0.8572143);
    path_0.cubicTo(
        size.width * 0.8851000,
        size.height * 0.8571571,
        size.width * 0.9250333,
        size.height * 0.8577429,
        size.width * 0.9174333,
        size.height * 0.8574571);
    path_0.cubicTo(
        size.width * 0.8584833,
        size.height * 0.8581143,
        size.width * 0.8340000,
        size.height * 0.8916429,
        size.width * 0.8339167,
        size.height * 0.9286571);
    path_0.cubicTo(
        size.width * 0.8329333,
        size.height * 0.9625000,
        size.width * 0.7977167,
        size.height * 0.9985857,
        size.width * 0.7497500,
        size.height * 0.9980142);
    path_0.cubicTo(
        size.width * 0.5733833,
        size.height * 0.9982142,
        size.width * 0.2602167,
        size.height * 0.9992478,
        size.width * 0.0838333,
        size.height * 0.9994811);
    path_0.cubicTo(
        size.width * 0.0403500,
        size.height * 0.9976141,
        size.width * 0.0000833,
        size.height * 0.9640143,
        size.width * 0.0004500,
        size.height * 0.9290714);
    path_0.cubicTo(
        size.width * 0.0004167,
        size.height * 0.8454143,
        size.width * 0.0004167,
        size.height * 0.4297143,
        size.width * 0.0003333,
        size.height * 0.1787857);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
