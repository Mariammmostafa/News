import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newss_app/core/extensions/context_extension.dart';
import 'package:newss_app/core/extensions/number_extension.dart';
import 'package:newss_app/core/theme/app_colors.dart';
import 'package:newss_app/features/category_news/domain/entities/article_data.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleCard extends StatelessWidget {
  final ArticleData articleData;
  const ArticleCard({super.key, required this.articleData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.isDark ? Colors.white : AppColors.black,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: articleData.urlToImage,
            height: context.height * 0.15,
          ),
          16.spaceVertical,
          Text(
            articleData.title,
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          16.spaceVertical,
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  articleData.author,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              16.spaceHorizontal,
              Expanded(
                child: Text(
                  timeago.format(
                    articleData.publishedAt ?? DateTime.now(),
                  ),
                  textAlign: TextAlign.end,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
