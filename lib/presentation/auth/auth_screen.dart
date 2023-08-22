import 'package:arboblar_uz/presentation/auth/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:arboblar_uz/presentation/auth/pages/signup_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLoginPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Arboblar.uz',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            isLoginPage
                ? SignInPage(
                    onChanged: () {
                      setState(() {
                        isLoginPage = false;
                      });
                    },
                  )
                : SignUpScreen(
                    onChanged: () {
                      setState(() {
                        isLoginPage = true;
                      });
                    },
                  ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
