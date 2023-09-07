import 'package:arboblar_uz/data/models/universal_data.dart';
import 'package:arboblar_uz/data/network/api_service.dart';
import 'package:arboblar_uz/servis/servis_locator.dart';

class ProfileRepository {
  ProfileRepository();

  Future<UniversalData> getUserData() async =>
      getIt<ApiService>().getProfileData();
}
