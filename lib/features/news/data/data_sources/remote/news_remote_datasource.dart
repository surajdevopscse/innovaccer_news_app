import 'package:innovaccer_news_app/core/api/api_services.dart';
import 'package:innovaccer_news_app/features/news/data/models/news_model.dart';
import 'package:innovaccer_news_app/features/news/domain/usecases/news_usecases.dart';

import '../../../../../core/error/exceptions.dart';

abstract class NewsRemoteDataSource {
  Future<NewsModel> fetchNews({required NewsParams params});
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final ApiService services;
  NewsRemoteDataSourceImpl({
    required this.services,
  });

  @override
  Future<NewsModel> fetchNews({required NewsParams params}) async {
    try {
      var response =
          await services.get(params.path, queryParameters: params.parameters);
      switch (response.statusCode) {
        case 200:
          final result = NewsModel.fromJson(response.data);
          return result;
        case 400:
          throw ServerException(message: 'Bad Request');
        case 401:
          throw ServerException(message: 'Unathorized');
        case 500:
          throw ServerException(message: 'Internal Server Error');
        default:
          throw ServerException(message: 'Error');
      }
    } on TypeError catch (_) {
      throw CastException(message: 'Cast Error');
    } on UnsupportedError catch (_) {
      throw ServerException(message: 'Server Error');
    } catch (e) {
      rethrow;
    }
  }
}
