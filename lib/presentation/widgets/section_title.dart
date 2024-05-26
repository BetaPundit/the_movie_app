import 'package:flutter/material.dart';
import 'package:movie_app/config/themes/app_colors.dart';
import 'package:movie_app/config/themes/extensions/app_text_style.dart';
import 'package:movie_app/utils/extensions/app_theme_extension.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final textStyle = context.themeData.extension<AppTextStyle>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Text(
            title.toUpperCase(),
            style: textStyle.bodyMedium.copyWith(color: AppColors.text),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.textLight.withOpacity(.25),
                    AppColors.textLight.withOpacity(.1),
                    Colors.white.withOpacity(0),
                  ],
                  stops: const [0, .65, 1],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
