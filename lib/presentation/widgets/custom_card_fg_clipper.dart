import 'package:flutter/material.dart';

class CustomCardFgClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0003333, size.height * 0.3335667);
    path_0.cubicTo(
        size.width * 0.0002167,
        size.height * 0.2475333,
        size.width * 0.0416333,
        size.height * 0.1672000,
        size.width * 0.0837667,
        size.height * 0.1676000);
    path_0.cubicTo(
        size.width * 0.1722333,
        size.height * 0.1676333,
        size.width * 0.3570000,
        size.height * 0.1669333,
        size.width * 0.4454500,
        size.height * 0.1669667);
    path_0.cubicTo(
        size.width * 0.4764667,
        size.height * 0.1665333,
        size.width * 0.4997333,
        size.height * 0.1659667,
        size.width * 0.4999667,
        size.height * 0.0842000);
    path_0.cubicTo(
        size.width * 0.5002167,
        size.height * 0.0312333,
        size.width * 0.5200667,
        size.height * 0.0005333,
        size.width * 0.5500333,
        size.height * 0.0002333);
    path_0.cubicTo(
        size.width * 0.6529667,
        size.height * 0.0006000,
        size.width * 0.8151167,
        size.height * 0.0016333,
        size.width * 0.9180500,
        size.height * 0.0020000);
    path_0.cubicTo(
        size.width * 0.9602167,
        size.height * 0.0017667,
        size.width * 0.9992667,
        size.height * 0.0835000,
        size.width * 0.9999167,
        size.height * 0.1680667);
    path_0.cubicTo(
        size.width * 0.9999833,
        size.height * 0.2514000,
        size.width * 1.0001167,
        size.height * 0.4175333,
        size.width * 1.0001833,
        size.height * 0.5008667);
    path_0.cubicTo(
        size.width * 0.9998833,
        size.height * 0.5839333,
        size.width * 0.9598000,
        size.height * 0.6660333,
        size.width * 0.9169833,
        size.height * 0.6663667);
    path_0.cubicTo(
        size.width * 0.8970833,
        size.height * 0.6676667,
        size.width * 0.9240667,
        size.height * 0.6665333,
        size.width * 0.9169000,
        size.height * 0.6666000);
    path_0.cubicTo(
        size.width * 0.8739333,
        size.height * 0.6669000,
        size.width * 0.8348833,
        size.height * 0.7375333,
        size.width * 0.8344167,
        size.height * 0.8341333);
    path_0.cubicTo(
        size.width * 0.8332333,
        size.height * 0.9265000,
        size.width * 0.7929667,
        size.height * 0.9988667,
        size.width * 0.7497500,
        size.height * 0.9979333);
    path_0.cubicTo(
        size.width * 0.5733833,
        size.height * 0.9981333,
        size.width * 0.2602167,
        size.height * 0.9991667,
        size.width * 0.0838333,
        size.height * 0.9994000);
    path_0.cubicTo(
        size.width * 0.0403500,
        size.height * 0.9975333,
        size.width * 0.0002980,
        size.height * 0.9162667,
        size.width * 0.0004510,
        size.height * 0.8347333);
    path_0.cubicTo(
        size.width * 0.0004157,
        size.height * 0.7511000,
        size.width * 0.0004167,
        size.height * 0.5844333,
        size.width * 0.0003333,
        size.height * 0.3335667);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
