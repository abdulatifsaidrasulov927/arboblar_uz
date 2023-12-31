import 'package:arboblar_uz/cubits/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arboblar_uz/cubits/auth/auth_cubit.dart';
import 'package:arboblar_uz/presentation/app_routes.dart';
import 'package:arboblar_uz/presentation/auth/widgets/global_text_fields.dart';
import 'package:arboblar_uz/utils/ui_utils/error_message_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String gmail = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Login page"),
      ),
      backgroundColor: Colors.white,
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
              GlobalTextField(
                hintText: "Gmail",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.start,
                onChanged: (v) {
                  gmail = v;
                },
              ),
              GlobalTextField(
                hintText: "Password",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.start,
                onChanged: (v) {
                  password = v;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RouteNames.registerScreen);
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 57,
                    width: 326,
                    child: ElevatedButton(
                      onPressed: () {
                        if (gmail.isNotEmpty && password.isNotEmpty) {
                          context.read<AuthCubit>().loginUser(
                                gmail: gmail,
                                password: password,
                              );
                          BlocProvider.of<ProfileCubit>(context).getUserData();
                        }
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16))),
                          elevation: const MaterialStatePropertyAll<double>(10),
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Colors.blue)),
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
        // buildWhen: (previous,current){
        //   return previous!=current;//false
        // },
        buildWhen: (previous, current) {
          print("PREVIOUS:$previous AND CURRENT:$current");
          return true;
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     context.read<AuthCubit>().updateState();
      //   },
      //   child: const Icon(Icons.update),
      // ),
    );
  }
}
