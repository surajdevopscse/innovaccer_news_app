import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_news_app/core/constants/constants.dart';
import 'package:innovaccer_news_app/core/extensions/date_extention.dart';
import 'package:innovaccer_news_app/core/utils/size_config.dart';
import 'package:innovaccer_news_app/features/news/data/models/news_model.dart';
import 'package:innovaccer_news_app/features/news/presenatation/view/news_details_page.dart';

class NewsCardWidget extends StatelessWidget {
  final Article news;

  const NewsCardWidget({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailsPage(news: news),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CachedNetworkImage(
                    height: SizeConfig.height(0.2),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    imageUrl: news.urlToImage ?? '',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter: const ColorFilter.mode(
                            Colors.red,
                            BlendMode.colorBurn,
                          ),
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const LinearProgressIndicator(),
                    errorWidget: (context, url, error) => Image.network(
                      AppConstants.IMAGENOTFOUND,
                      height: SizeConfig.height(0.2),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Title
                Text(
                  news.title ?? 'No Title Available',
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),

                // Source Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      news.source?.name ?? 'Unknown Source',
                      style: theme.textTheme.headlineSmall
                          ?.copyWith(color: theme.iconTheme.color),
                    ),
                    Text(
                      '${news.publishedAt?.toDayMonthYear()} ${news.publishedAt?.toTime()}',
                      style: theme.textTheme.headlineSmall
                          ?.copyWith(color: theme.iconTheme.color),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Description
                Text(
                  news.description ?? 'No Description Available',
                  style: theme.textTheme.headlineSmall,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                // Read More Button
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailsPage(news: news),
                        ),
                      );
                    },
                    child: Text(
                      'Read More',
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
