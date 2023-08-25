import 'package:arboblar_uz/data/models/universal_data.dart';
import 'package:arboblar_uz/data/network/api_service.dart';

class ProfileRepository {
  final ApiService apiService;

  ProfileRepository({required this.apiService});

  Future<UniversalData> getUserData() async => apiService.getProfileData();
}
