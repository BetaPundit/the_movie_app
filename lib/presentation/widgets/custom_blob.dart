import 'package:flutter/material.dart';
import 'package:movie_app/config/themes/extensions/app_text_style.dart';
import 'package:movie_app/presentation/widgets/custom_blob_painter.dart';
import 'package:movie_app/utils/extensions/app_theme_extension.dart';
import 'package:movie_app/utils/helper_functions.dart';

class CustomBlob extends StatelessWidget {
  final DateTime date;
  final String title;
  final String subtitle;

  const CustomBlob({
    super.key,
    required this.date,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = context.themeData.extension<AppTextStyle>()!;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      child: Stack(
        children: [
          CustomPaint(
            size: Size.fromHeight(
              (115).toDouble(),
            ),
            painter: CustomBlobPainter(),
          ),
          // Date
          Positioned(
            top: 8,
            left: 16,
            child: Text(
              HelperFunctions.formatDate(date).toUpperCase(),
              style: textStyle.labelMedium,
            ),
          ),

          // Title
          Positioned(
            top: 48,
            left: 16,
            child: Text(
              title,
              style:
                  textStyle.titleMedium.copyWith(fontWeight: FontWeight.w600),
            ),
          ),

          // Subtitle
          Positioned(
            top: 80,
            left: 16,
            child: Text(
              subtitle,
              style: textStyle.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
