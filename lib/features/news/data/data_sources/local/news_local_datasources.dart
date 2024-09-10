import 'dart:convert';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:innovaccer_news_app/features/news/data/models/news_model.dart';

class LocalDataSource {
  final CacheManager cacheManager = DefaultCacheManager();

  Future<NewsModel?> getCachedNews() async {
    var file = await cacheManager.getFileFromCache('news_cache');
    if (file != null) {
      var cachedData = await file.file.readAsString();
      return jsonDecode(cachedData);
    }
    return null;
  }

  Future<void> cacheNews(List<NewsModel> articles) async {
    await cacheManager.putFile(
      'news_cache',
      utf8.encode(jsonEncode(articles.map((a) => a.toJson()).toList())),
      fileExtension: 'json',
    );
  }
}
