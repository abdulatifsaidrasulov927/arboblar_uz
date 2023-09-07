import 'package:arboblar_uz/data/local/storage_repository.dart';
import 'package:arboblar_uz/data/models/universal_data.dart';
import 'package:arboblar_uz/data/models/user/user_model.dart';
import 'package:arboblar_uz/data/network/api_service.dart';
import 'package:arboblar_uz/servis/servis_locator.dart';

class AuthRepository {
  AuthRepository();

  Future<UniversalData> sendCodeToGmail({
    required String gmail,
    required String password,
  }) async =>
      getIt<ApiService>().sendCodeToGmail(
        gmail: gmail,
        password: password,
      );

  Future<UniversalData> confirmCode({required String code}) async =>
      getIt<ApiService>().confirmCode(code: code);

  Future<UniversalData> registerUser({required UserModel userModel}) async =>
      getIt<ApiService>().registerUser(userModel: userModel);

  Future<UniversalData> loginUser({
    required String gmail,
    required String password,
  }) async =>
      getIt<ApiService>().loginUser(
        gmail: gmail,
        password: password,
      );

  String getToken() => StorageRepository.getString("token");

  Future<bool?> deleteToken() async => StorageRepository.deleteString("token");

  Future<void> setToken(String newToken) async =>
      StorageRepository.putString("token", newToken);
}
