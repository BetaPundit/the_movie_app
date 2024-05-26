import 'package:flutter/material.dart';
import 'package:movie_app/config/themes/app_colors.dart';
import 'package:movie_app/config/themes/extensions/app_text_style.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: AppColors.primary,
      ),
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      splashColor: Colors.black12,
      extensions: const [AppTextStyle.light],
    );
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: AppColors.primary,
      ),
      scaffoldBackgroundColor: AppColors.text,
      primaryColor: AppColors.primary,
      splashColor: Colors.white10,
      extensions: [AppTextStyle.dark],
    );
  }
}
