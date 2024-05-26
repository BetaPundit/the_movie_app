import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/config/themes/extensions/app_text_style.dart';
import 'package:movie_app/presentation/widgets/custom_card_bg_clipper.dart';
import 'package:movie_app/presentation/widgets/custom_card_fg_clipper.dart';
import 'package:movie_app/presentation/widgets/custom_card_fg_painter.dart';
import 'package:movie_app/utils/constants/constants.dart';
import 'package:movie_app/utils/extensions/app_theme_extension.dart';

class NowPlayingMovieCard extends StatelessWidget {
  final String? imageUrl;
  final int? views;
  final String? title;
  final String? subtitle;
  final int? votes;
  final double? rating;

  const NowPlayingMovieCard({
    super.key,
    required this.imageUrl,
    required this.views,
    required this.title,
    required this.subtitle,
    required this.votes,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = context.themeData.extension<AppTextStyle>()!;

    return SizedBox(
      width: 250,
      height: 300,
      child: Stack(
        children: [
          // Background Image
          ClipPath(
            clipper: CustomCardBgClipper(),
            child: Image.network(
              '${Constants.baseImageUrl}${imageUrl ?? ''}',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // Rating
          Positioned(
            top: 5,
            left: 58,
            child: Row(
              children: [
                Text(
                  (rating ?? 0).toStringAsFixed(2),
                  style: textStyle.titleSmall,
                ),
                Text(
                  ' ⭐️',
                  style: textStyle.labelMedium,
                ),
              ],
            ),
          ),

          // Views
          Positioned(
            top: 10,
            right: 10,
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.visibility_outlined,
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${views ?? 0}',
                        style: textStyle.bodySmall.copyWith(
                          color: Colors.white,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    CupertinoIcons.heart,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),

          // Foreground blob
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: CustomCardFgClipper(),
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: CustomPaint(
                  size: Size.fromHeight(
                    (145).toDouble(),
                  ),
                  painter: CustomCardFgPainter(),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 14,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: textStyle.labelLarge.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: 200,
                  child: Row(
                    children: [
                      const Icon(
                        CupertinoIcons.calendar,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          subtitle ?? '',
                          style: textStyle.bodySmall.copyWith(
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${votes ?? 0} Votes',
                  style: textStyle.titleSmall.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MovieCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double borderRadius = 24.0;

    // Top left corner
    path.moveTo(0, borderRadius);
    path.quadraticBezierTo(0, 0, borderRadius, 0);

    // Top right corner
    path.lineTo(size.width - borderRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, borderRadius);

    // Right side
    path.lineTo(size.width, size.height - 80);

    // Bottom right cut
    path.quadraticBezierTo(
        size.width * 0.75, size.height, size.width * 0.5, size.height - 30);

    // Bottom left cut
    path.quadraticBezierTo(
        size.width * 0.25, size.height - 60, 0, size.height - 20);

    // Close path
    path.lineTo(0, borderRadius);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
