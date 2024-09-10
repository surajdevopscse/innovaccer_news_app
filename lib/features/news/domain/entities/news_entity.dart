import 'package:equatable/equatable.dart';
import 'package:innovaccer_news_app/features/news/data/models/news_model.dart';

class NewsEntity extends Equatable {
  final String status;
  final String? message;
  final String? code;
  final int? totalResults;
  final List<Article>? articles;
  const NewsEntity({
    required this.status,
    required this.message,
    required this.code,
    required this.articles,
    required this.totalResults,
  });

  @override
  List<Object?> get props => [status, message, code, totalResults];
}
