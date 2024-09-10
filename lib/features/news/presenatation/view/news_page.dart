import 'package:flutter/material.dart';
import 'package:innovaccer_news_app/config/theme/theme_notifier.dart';
import 'package:innovaccer_news_app/core/common_widget/offline_snackbar.dart';
import 'package:innovaccer_news_app/core/common_widget/search_bar.dart';
import 'package:innovaccer_news_app/core/constants/constants.dart';
import 'package:innovaccer_news_app/features/news/presenatation/provider/news_provider.dart';
import 'package:innovaccer_news_app/features/news/presenatation/widgets/top_headlines_widget.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.APPTITLE),
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.toggleTheme(
                themeProvider.themeMode != ThemeMode.dark,
              );
            },
            icon: themeProvider.themeMode == ThemeMode.dark
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
          ),
        ],
      ),
      body: Consumer<NewsProvider>(
        builder: (context, provider, child) {
          return RefreshIndicator(
            onRefresh: () async {
              await provider.fetchNews(); // Refresh data
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SearchBarCommon(
                    hintText: 'Search for news',
                    onSearch: (query) {
                      provider.query = query;
                      provider.fetchNews();
                      if (provider.noInternet) {
                        showOfflineSnackbar(context);
                      }
                    },
                  ),
                ),
                const Expanded(
                  child: TopHeadlines(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
