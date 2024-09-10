import 'package:innovaccer_news_app/core/resources/data_state.dart';
import 'package:innovaccer_news_app/features/news/domain/entities/news_entity.dart';
import 'package:innovaccer_news_app/features/news/domain/usecases/news_usecases.dart';

abstract class NewsRepository {
  Future<DataState<NewsEntity>> fetchNews({required NewsParams params});
}
