import 'package:arboblar_uz/ui/user/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arboblar_uz/cubits/auth/auth_cubit.dart';
import 'package:arboblar_uz/ui/presentation/app_routes.dart';
import 'package:arboblar_uz/ui/presentation/tab/articles/articles_screen.dart';
import 'package:arboblar_uz/ui/presentation/tab/profile/profile_screen.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [];

  int currentIndex = 0;

  @override
  void initState() {
    screens = [
      ArticlesScreen(),
      ProfileScreen(),
      UsersPage(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        child: screens[currentIndex],
        listener: (context, state) {
          if (state is AuthUnAuthenticatedState) {
            Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.article), label: "Article"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_outline_rounded), label: "Users"),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
