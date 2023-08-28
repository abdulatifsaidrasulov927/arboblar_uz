import 'package:arboblar_uz/data/models/article_model/article_model.dart';
import 'package:arboblar_uz/data/models/universal_data.dart';
import 'package:arboblar_uz/data/network/api_service.dart';

class ArticlesRepository {
  final ApiService apiService;

  ArticlesRepository({required this.apiService});

  Future<UniversalData> getArticles() async => apiService.getArticls();

  Future<UniversalData> getArticlesById(int articleById) async =>
      apiService.getArticlsById(articleById);

  Future<UniversalData> createArticles(ArticleModel newArticles) async =>
      apiService.createArticles(articleModel: newArticles);
}
