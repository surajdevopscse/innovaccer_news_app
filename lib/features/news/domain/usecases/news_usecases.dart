import 'package:innovaccer_news_app/core/resources/data_state.dart';
import 'package:innovaccer_news_app/features/news/domain/entities/news_entity.dart';
import 'package:innovaccer_news_app/features/news/domain/repositories/news_repository.dart';

class NewsParams {
  final String path;
  final Map<String, String> parameters;
  NewsParams({
    required this.path,
    required this.parameters,
  });
}

class NewsUseCases implements NewsRepository {
  final NewsRepository newsRepository;
  NewsUseCases({
    required this.newsRepository,
  });

  @override
  Future<DataState<NewsEntity>> fetchNews({required NewsParams params}) async {
    return await newsRepository.fetchNews(params: params);
  }
}
