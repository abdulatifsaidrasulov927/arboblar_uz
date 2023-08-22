import 'package:arboblar_uz/ui/presentation/auth/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:arboblar_uz/ui/presentation/auth/pages/signup_page.dart';

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
      appBar: AppBar(
        leading: isLoginPage
            ? const Text('')
            : GestureDetector(
                onTap: () {
                  setState(() {
                    isLoginPage = true;
                  });
                },
                child: const Icon(Icons.keyboard_backspace)),
        backgroundColor: Colors.blueAccent,
      ),
      body: isLoginPage
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
      backgroundColor: Colors.white,
    );
  }
}
