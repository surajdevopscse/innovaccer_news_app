import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_news_app/core/extensions/date_extention.dart';
import 'package:innovaccer_news_app/core/utils/size_config.dart';
import 'package:innovaccer_news_app/features/news/data/models/news_model.dart';
import 'package:innovaccer_news_app/features/news/presenatation/provider/news_provider.dart';
import 'package:provider/provider.dart';

class NewsDetailsPage extends StatelessWidget {
  final Article news;

  const NewsDetailsPage({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(news.title ?? 'News Details'),
        backgroundColor: theme.primaryColor,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero Image
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: news.urlToImage ?? '',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: CachedNetworkImage(
                        height: SizeConfig.height(0.5),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        imageUrl: news.urlToImage ?? '',
                        placeholder: (context, url) =>
                            const LinearProgressIndicator(),
                        errorWidget: (context, url, error) => Image.network(
                          'https://via.placeholder.com/600x400.png?text=Image+Not+Found',
                          height: SizeConfig.height(0.3),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    news.title ?? 'No Title Available',
                    style: theme.textTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),

                // Published Date
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    '${news.publishedAt?.toDayMonthYear()} ${news.publishedAt?.toTime()}',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.iconTheme.color),
                  ),
                ),
                const SizedBox(height: 15),

                // Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    news.description ?? 'No Description Available',
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 20),

                // Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    news.content ?? 'No Content Available',
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 20),

                // Source Name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Source: ${news.source?.name ?? 'Unknown Source'}',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.iconTheme.color),
                  ),
                ),
                const SizedBox(height: 100), // Space for the sticky button
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<NewsProvider>(context, listen: false)
                      .launchInWebView(Uri.parse(news.url ?? ''));
                },
                child: const Text('Read Full Article'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
