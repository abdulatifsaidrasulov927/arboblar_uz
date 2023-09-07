import 'package:arboblar_uz/data/network/api_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());
}
