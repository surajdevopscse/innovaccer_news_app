// data/services/api_service.dart
import 'package:dio/dio.dart';
import 'package:innovaccer_news_app/core/api/api_interceptor.dart';

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://newsapi.org/v2', // Base URL for the API
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        ) {
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
    _dio.interceptors.add(ApiInterceptor());
  }

  // Generic method to make GET requests
  Future<Response<T>> get<T>(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get<T>(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }

  // Generic method to make POST requests
  Future<Response<T>> post<T>(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post<T>(
        endpoint,
        data: data,
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
