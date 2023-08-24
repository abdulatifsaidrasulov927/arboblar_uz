import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arboblar_uz/cubits/auth/auth_cubit.dart';
import 'package:arboblar_uz/data/models/user/user_model.dart';
import 'package:arboblar_uz/ui/presentation/app_routes.dart';
import 'package:arboblar_uz/utils/ui_utils/error_message_dialog.dart';

// ignore: must_be_immutable
class GmailConfirmScreen extends StatefulWidget {
  GmailConfirmScreen({super.key, required this.userModel});

  UserModel userModel;

  @override
  State<GmailConfirmScreen> createState() => _GmailConfirmScreenState();
}

class _GmailConfirmScreenState extends State<GmailConfirmScreen> {
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Confirm"),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: codeController,
                  decoration: const InputDecoration(
                      hintText: 'Code',
                      labelText: 'Code',
                      prefixIcon: Icon(
                        Icons.password,
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
                      'Confirm',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    onPressed: () {
                      context
                          .read<AuthCubit>()
                          .confirmGmail(codeController.text);
                    },
                  ),
                ),
              )),
              const SizedBox(height: 50)
            ],
          );
        },
        listener: (context, state) {
          if (state is AuthConfirmCodeSuccessState) {
            context.read<AuthCubit>().registerUser(widget.userModel);
          }

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
