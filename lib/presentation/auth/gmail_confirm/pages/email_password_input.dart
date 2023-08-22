import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arboblar_uz/cubits/auth/auth_cubit.dart';
import 'package:arboblar_uz/presentation/auth/widgets/global_text_fields.dart';

class EmailPasswordInput extends StatelessWidget {
  const EmailPasswordInput(
      {super.key,
      required this.gmailController,
      required this.passwordController});

  final TextEditingController gmailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      if (state is AuthLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Column(
        children: [
          GlobalTextField(
            hintText: "Gmail",
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            textAlign: TextAlign.center,
            controller: gmailController,
          ),
          GlobalTextField(
            hintText: "Password",
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            textAlign: TextAlign.center,
            controller: passwordController,
          )
        ],
      );
    });
  }
}
