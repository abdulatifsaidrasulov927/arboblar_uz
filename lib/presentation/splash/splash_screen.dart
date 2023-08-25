import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arboblar_uz/cubits/auth/auth_cubit.dart';
import 'package:arboblar_uz/cubits/profile/profile_cubit.dart';
import 'package:arboblar_uz/data/local/storage_repository.dart';
import 'package:arboblar_uz/presentation/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() async {
    if (StorageRepository.getString("token").isEmpty) {
      Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
    } else {
      Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
    }
  }

  @override
  void initState() {
    BlocProvider.of<AuthCubit>(context).checkLoggedState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          return const Center(child: Text("arboblar.uz"));
        },
        listener: (context, state) {
          if (state is AuthUnAuthenticatedState) {
            Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
          }
          if (state is AuthLoggedState) {
            BlocProvider.of<ProfileCubit>(context).getUserData();
            Navigator.pushReplacementNamed(context, RouteNames.tabBox);
          }
        },
      ),
    );
  }
}
