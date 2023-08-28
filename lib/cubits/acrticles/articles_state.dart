import 'package:arboblar_uz/data/models/article_model/article_model.dart';
import 'package:arboblar_uz/data/models/status/form_status.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ArticlesState extends Equatable {
  final String statusText;
  final ArticleModel articleModel;
  ArticleModel? articleDetails;
  final List<ArticleModel> articles;
  final FormStatus status;

  ArticlesState({
    required this.articleDetails,
    required this.articleModel,
    this.statusText = "",
    this.status = FormStatus.pure,
    required this.articles,
  });

  ArticlesState copyWith({
    String? statusText,
    ArticleModel? articleModel,
    ArticleModel? articleDetails,
    List<ArticleModel>? articles,
    FormStatus? status,
  }) =>
      ArticlesState(
        articleDetails: articleDetails ?? this.articleDetails,
        articleModel: articleModel ?? this.articleModel,
        articles: articles ?? this.articles,
        statusText: statusText ?? this.statusText,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [
        articleModel,
        articles,
        statusText,
        status,
        articleDetails,
      ];

  bool canAddArticles() {
    if (articleModel.username.isEmpty) return false;

    if (articleModel.image.isEmpty) return false;
    if (articleModel.title.isEmpty) return false;
    if (articleModel.avatar.isEmpty) return false;
    if (articleModel.description.isEmpty) return false;
    return true;
  }
}
