import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arboblar_uz/cubits/auth/auth_cubit.dart';
import 'package:arboblar_uz/ui/presentation/app_routes.dart';
import 'package:arboblar_uz/utils/ui_utils/error_message_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController gmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text("Login"),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: gmailController,
                  decoration: const InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.blue,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius:
                              BorderRadius.all(Radius.circular(9.0)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: passwordController,
                  decoration: const InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius:
                              BorderRadius.all(Radius.circular(9.0)))),
                ),
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    onPressed: () {
                      context.read<AuthCubit>().loginUser(
                            gmail: gmailController.text,
                            password: passwordController.text,
                          );
                    },
                  ),
                ),
              )),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RouteNames.registerScreen);
                    },
                  ),
                ),
              )),
            ],
          );
        },
        listener: (context, state) {
          if (state is AuthLoggedState) {
            Navigator.pushReplacementNamed(context, RouteNames.tabBox);
          }

          if (state is AuthErrorState) {
            showErrorMessage(message: state.errorText, context: context);
          }
        },
      ),
    );
  }
}
