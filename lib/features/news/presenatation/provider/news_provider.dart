import 'package:flutter/material.dart';
import 'package:innovaccer_news_app/config/api/api_contants.dart';
import 'package:innovaccer_news_app/core/resources/data_state.dart';
import 'package:innovaccer_news_app/features/news/domain/entities/news_entity.dart';
import 'package:innovaccer_news_app/features/news/domain/usecases/news_usecases.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsProvider with ChangeNotifier {
  final NewsUseCases fetchNewsUseCase;
  NewsEntity? newsList;
  bool isLoading = false;
  String errorMessage = '';
  String query = 'elon';

  NewsProvider(this.fetchNewsUseCase) {
    fetchNews();
  }

  Future<void> fetchNews({bool refresh = false}) async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      final result = await fetchNewsUseCase.fetchNews(
        params: NewsParams(
          path: "/everything",
          parameters: {
            'q': query.isEmpty ? 'elon' : query,
            'apiKey': ApiContants.apiKey,
          },
        ),
      );
      if (result is DataSuccess) {
        newsList = result.data!;
      }
    } catch (e) {
      errorMessage = 'Failed to load news.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> launchInWebView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }
}
