import 'package:arboblar_uz/presentation/tab/profile/profile_screen_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arboblar_uz/cubits/auth/auth_cubit.dart';
import 'package:arboblar_uz/cubits/tab/tab_cubit.dart';
import 'package:arboblar_uz/presentation/app_routes.dart';
import 'package:arboblar_uz/presentation/tab/websites/websites_screen.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      const WebsitesScreen(),
      const ProfileScreenUi(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        child: IndexedStack(
          index: context.watch<TabCubit>().state,
          children: screens,
        ),
        listener: (context, state) {
          if (state is AuthUnAuthenticatedState) {
            Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.web), label: "Web"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: context.watch<TabCubit>().state,
        onTap: context.read<TabCubit>().changeTabIndex,
      ),
    );
  }
}
