import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/config/themes/app_colors.dart';
import 'package:movie_app/config/themes/extensions/app_text_style.dart';
import 'package:movie_app/utils/extensions/app_theme_extension.dart';

class MovieSearchBar extends StatelessWidget {
  const MovieSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = context.themeData.extension<AppTextStyle>()!;

    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(CupertinoIcons.search, color: AppColors.text),
        hintText: 'Search Movies by name...',
        hintStyle: textStyle.bodyLarge.copyWith(color: AppColors.textLight),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
