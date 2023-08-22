import 'package:arboblar_uz/ui/presentation/app_routes.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key, required this.onChanged}) : super(key: key);

  final VoidCallback onChanged;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.blue),
              child: const Center(child: Text('Sign in')),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Sign in',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
                Navigator.pushNamed(context, RouteNames.confirmGmail);
              },
              child: const Text(
                'Forgot Password',
              ),
            ),
            Container(
                height: 50,
                width: 400,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                    widget.onChanged.call();
                  },
                )
              ],
            ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, RouteNames.confirmGmail);
            //   },
            //   child: const Text(
            //     "First Confirm your",
            //     style: TextStyle(
            //         color: Color(0xFF4F8962),
            //         fontSize: 18,
            //         fontWeight: FontWeight.w800),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
