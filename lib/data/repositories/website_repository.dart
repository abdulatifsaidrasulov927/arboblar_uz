import 'package:arboblar_uz/data/models/universal_data.dart';
import 'package:arboblar_uz/data/models/websites/website_model.dart';
import 'package:arboblar_uz/data/network/api_service.dart';
import 'package:arboblar_uz/servis/servis_locator.dart';

class WebsiteRepository {
  WebsiteRepository();

  Future<UniversalData> getWebsites() async =>
      getIt<ApiService>().getWebsites();

  Future<UniversalData> getWebsiteById(int websiteId) async =>
      getIt<ApiService>().getWebById(websiteId);

  Future<UniversalData> createWebsite(WebsiteModel newWebsite) async =>
      getIt<ApiService>().createWebsite(websiteModel: newWebsite);
}
