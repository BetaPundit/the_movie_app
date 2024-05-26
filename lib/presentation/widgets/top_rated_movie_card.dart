import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/config/themes/app_colors.dart';
import 'package:movie_app/config/themes/extensions/app_text_style.dart';
import 'package:movie_app/utils/constants/constants.dart';
import 'package:movie_app/utils/extensions/app_theme_extension.dart';

class TopRatedMovieCard extends StatelessWidget {
  final String? imageUrl;
  final int? views;
  final String? title;
  final String? subtitle;
  final int? votes;
  final double? rating;

  const TopRatedMovieCard({
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

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(4),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  '${Constants.baseImageUrl}${imageUrl ?? ''}',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 16,
                bottom: 16,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.visibility,
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${views ?? 0}',
                        style: textStyle.bodyMedium.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              title ?? '',
              style: textStyle.titleMedium,
            ),
          ),
          const SizedBox(height: 8),

          // Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                const Icon(
                  CupertinoIcons.calendar,
                  color: AppColors.textLight,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    subtitle ?? '',
                    style: textStyle.bodyMedium.copyWith(
                      color: AppColors.textLight,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          // Votes & Ratings
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
            child: Row(
              children: [
                Text(
                  '${votes ?? 0} Votes',
                  style: textStyle.titleSmall.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
                SizedBox(
                  height: 18,
                  child: VerticalDivider(
                    width: 24,
                    thickness: 1.8,
                    color: Colors.grey[300],
                  ),
                ),
                Text(
                  (rating ?? 0).toStringAsFixed(2),
                  style: textStyle.titleSmall.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
