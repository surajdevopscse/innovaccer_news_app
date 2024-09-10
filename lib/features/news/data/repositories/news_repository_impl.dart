import 'package:innovaccer_news_app/core/error/exceptions.dart';
import 'package:innovaccer_news_app/core/resources/data_state.dart';
import 'package:innovaccer_news_app/features/news/data/data_sources/local/news_local_datasources.dart';
import 'package:innovaccer_news_app/features/news/data/data_sources/remote/news_remote_datasource.dart';
import 'package:innovaccer_news_app/features/news/data/models/news_model.dart';
import 'package:innovaccer_news_app/features/news/domain/entities/news_entity.dart';
import 'package:innovaccer_news_app/features/news/domain/repositories/news_repository.dart';
import 'package:innovaccer_news_app/features/news/domain/usecases/news_usecases.dart';

class NewsRepositoryImpl implements NewsRepository {
  LocalDataSource newsLocalDataSource;
  NewsRemoteDataSource newsRemoteDataSource;
  NewsRepositoryImpl({
    required this.newsLocalDataSource,
    required this.newsRemoteDataSource,
  });

  @override
  Future<DataState<NewsEntity>> fetchNews({required NewsParams params}) async {
    try {
      final outputNews = await _fetchNewsAndAddToLocal(params: params);
      return DataSuccess(data: outputNews);
    } on ServerException catch (e) {
      return DataFailed(error: e.message);
    } on CastException catch (e) {
      return DataFailed(error: e.message);
    } on CacheException catch (e) {
      return DataFailed(error: e.message);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }

  Future<NewsEntity?> _fetchNewsAndAddToLocal(
      {required NewsParams params}) async {
    try {
      NewsModel news = await newsRemoteDataSource.fetchNews(params: params);
      return NewsEntity(
        status: news.status ?? '',
        message: news.message,
        code: news.code,
        articles: news.articles,
        totalResults: news.totalResults,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<NewsEntity?> _getLocalNews() async {
    try {
      NewsModel? news = await newsLocalDataSource.getCachedNews();
      return NewsEntity(
          status: news?.status ?? '',
          message: news?.message,
          code: news?.code,
          articles: news?.articles,
          totalResults: news?.totalResults);
    } catch (e) {
      rethrow;
    }
  }

  Future<NewsEntity?> _addToLocalNews({required NewsModel news}) async {
    try {
      return await _getLocalNews();
    } catch (e) {
      rethrow;
    }
  }
}
