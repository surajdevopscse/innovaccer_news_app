import 'package:flutter/material.dart';
import 'package:innovaccer_news_app/core/common_widget/empty_screen.dart';
import 'package:innovaccer_news_app/features/news/presenatation/provider/news_provider.dart';
import 'package:innovaccer_news_app/features/news/presenatation/widgets/news_card_widget.dart';
import 'package:provider/provider.dart';

class TopHeadlines extends StatelessWidget {
  const TopHeadlines({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading && provider.newsList?.articles == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (provider.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: ${provider.errorMessage}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => provider.fetchNews(), // Retry fetching data
                  child: const Icon(
                    Icons.refresh,
                    size: 24,
                  ),
                ),
              ],
            ),
          );
        } else if (provider.newsList?.articles == null ||
            provider.newsList!.articles!.isEmpty) {
          return const EmptyScreen(
            message: 'No news articles available',
          );
        } else {
          return ListView.builder(
            itemCount: provider.newsList?.articles!.length,
            itemBuilder: (context, index) {
              final article = provider.newsList?.articles![index];
              return NewsCardWidget(news: article!);
            },
          );
        }
      },
    );
  }
}
