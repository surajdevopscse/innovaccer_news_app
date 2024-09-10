import 'package:innovaccer_news_app/features/news/data/models/news_model.dart';
import 'package:innovaccer_news_app/features/news/domain/entities/news_entity.dart';

extension NewsModelExtension on NewsModel {
  NewsEntity get toNewsEntity => const NewsEntity(
        status: '',
        message: '',
        code: '',
        totalResults: null,
        articles: [],
      );
}
