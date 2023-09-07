import 'package:arboblar_uz/data/models/article_model/article_model.dart';
import 'package:arboblar_uz/data/models/universal_data.dart';
import 'package:arboblar_uz/data/network/api_service.dart';
import 'package:arboblar_uz/servis/servis_locator.dart';

class ArticlesRepository {
  ArticlesRepository();

  Future<UniversalData> getArticles() async => getIt<ApiService>().getArticls();

  Future<UniversalData> getArticlesById(int articleById) async =>
      getIt<ApiService>().getArticlsById(articleById);

  Future<UniversalData> createArticles(ArticleModel newArticles) async =>
      getIt<ApiService>().createArticles(articleModel: newArticles);
}
