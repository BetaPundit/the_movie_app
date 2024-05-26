import 'package:flutter/material.dart';
import 'package:movie_app/config/themes/app_colors.dart';
import 'package:movie_app/config/themes/extensions/app_text_style.dart';
import 'package:movie_app/utils/extensions/app_theme_extension.dart';

class ErrorCard extends StatelessWidget {
  final String errorMessage;
  final Function()? onRetry;

  const ErrorCard({
    super.key,
    required this.errorMessage,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = context.themeData.extension<AppTextStyle>()!;

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.07),
            offset: const Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.orange[900],
            size: 40,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Error',
                  style: textStyle.titleSmall.copyWith(
                    color: Colors.orange[900],
                  ),
                ),
                Text(
                  errorMessage,
                  style: textStyle.bodyMedium.copyWith(
                    color: AppColors.textMedium,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                onRetry?.call();
              },
              child: Text(
                'Retry',
                style: textStyle.labelMedium.copyWith(
                  color: Colors.deepPurple[600],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
