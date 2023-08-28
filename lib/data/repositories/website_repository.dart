import 'package:arboblar_uz/data/models/universal_data.dart';
import 'package:arboblar_uz/data/models/websites/website_model.dart';
import 'package:arboblar_uz/data/network/api_service.dart';

class WebsiteRepository {
  final ApiService apiService;

  WebsiteRepository({required this.apiService});

  Future<UniversalData> getWebsites() async => apiService.getWebsites();

  Future<UniversalData> getWebsiteById(int websiteId) async =>
      apiService.getWebById(websiteId);

  Future<UniversalData> createWebsite(WebsiteModel newWebsite) async =>
      apiService.createWebsite(websiteModel: newWebsite);
}
