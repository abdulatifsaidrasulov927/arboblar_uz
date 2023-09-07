import 'package:arboblar_uz/cubits/acrticles/articles_cubit.dart';
import 'package:arboblar_uz/data/repositories/articles_reository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arboblar_uz/cubits/auth/auth_cubit.dart';
import 'package:arboblar_uz/cubits/profile/profile_cubit.dart';
import 'package:arboblar_uz/cubits/tab/tab_cubit.dart';
import 'package:arboblar_uz/cubits/user_data/user_data_cubit.dart';
import 'package:arboblar_uz/cubits/website/website_cubit.dart';
import 'package:arboblar_uz/data/local/storage_repository.dart';
import 'package:arboblar_uz/data/network/api_service.dart';
import 'package:arboblar_uz/data/repositories/auth_repository.dart';
import 'package:arboblar_uz/data/repositories/profile_repository.dart';
import 'package:arboblar_uz/data/repositories/website_repository.dart';
import 'package:arboblar_uz/presentation/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageRepository.getInstance();

  runApp(App(apiService: ApiService()));
}

TextEditingController phoneControllerMain = TextEditingController();
void dismissKeyboard(BuildContext context) => FocusScope.of(context).unfocus();

class App extends StatelessWidget {
  const App({super.key, required this.apiService});

  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => ProfileRepository(),
        ),
        RepositoryProvider(
          create: (context) => WebsiteRepository(),
        ),
        RepositoryProvider(
          create: (context) => ArticlesRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(create: (context) => TabCubit()),
          BlocProvider(create: (context) => UserDataCubit()),
          BlocProvider(
              create: (context) => ProfileCubit(
                  profileRepository: context.read<ProfileRepository>())),
          BlocProvider(
              create: (context) => WebsiteCubit(
                  websiteRepository: context.read<WebsiteRepository>())),
          BlocProvider(
              create: (context) => ArticlesCubit(
                  articlesRepository: context.read<ArticlesRepository>())),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.generateRoute,
          initialRoute: RouteNames.splashScreen,
        );
      },
    );
  }
}
