import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:innovaccer_news_app/features/news/data/models/news_model.dart';

class NewsLocalDataSource {
  final SharedPreferences sharedPreferences;

  NewsLocalDataSource(this.sharedPreferences);

  static const String cachedNewsKey = 'CACHED_NEWS';

  Future<void> cacheNews(List<Article> articles) async {
    final List<String> jsonArticles =
        articles.map((article) => json.encode(article.toJson())).toList();
    await sharedPreferences.setStringList(cachedNewsKey, jsonArticles);
  }

  Future<List<Article>?> getCachedNews() async {
    final List<String>? jsonArticles =
        sharedPreferences.getStringList(cachedNewsKey);
    if (jsonArticles != null && jsonArticles.isNotEmpty) {
      return jsonArticles
          .map((jsonString) => Article.fromJson(json.decode(jsonString)))
          .toList();
    } else {
      return null;
    }
  }

  Future<void> clearCahes() async {
    await sharedPreferences.remove(cachedNewsKey);
  }
}
