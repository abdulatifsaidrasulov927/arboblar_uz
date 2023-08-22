import 'package:image_picker/image_picker.dart';
import 'package:arboblar_uz/data/local/storage_repository.dart';
import 'package:arboblar_uz/data/models/universal_data.dart';
import 'package:arboblar_uz/data/models/user/user_model.dart';
import 'package:arboblar_uz/data/network/api_service.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository({required this.apiService});

  Future<UniversalData> sendCodeToGmail({
    required String gmail,
    required String password,
  }) async =>
      apiService.sendCodeToGmail(
        gmail: gmail,
        password: password,
      );

  Future<UniversalData> confirmCode({required String code}) async =>
      apiService.confirmCode(code: code);

  Future<UniversalData> registerUser({
    required UserModel userModel,
    required XFile file,
  }) async =>
      apiService.registerUser(
        userModel: userModel,
        file: file,
      );

  Future<UniversalData> loginUser({
    required String gmail,
    required String password,
  }) async =>
      apiService.loginUser(
        gmail: gmail,
        password: password,
      );

  String getToken() => StorageRepository.getString("token");
}