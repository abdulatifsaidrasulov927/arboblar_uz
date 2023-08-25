import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arboblar_uz/cubits/auth/auth_cubit.dart';
import 'package:arboblar_uz/cubits/profile/profile_cubit.dart';
import 'package:arboblar_uz/cubits/user_data/user_data_cubit.dart';
import 'package:arboblar_uz/data/models/user/user_model.dart';
import 'package:arboblar_uz/presentation/app_routes.dart';
import 'package:arboblar_uz/presentation/auth/widgets/global_button.dart';
import 'package:arboblar_uz/presentation/auth/widgets/global_text_fields.dart';
import 'package:arboblar_uz/utils/ui_utils/error_message_dialog.dart';

// ignore: must_be_immutable
class GmailConfirmScreen extends StatefulWidget {
  GmailConfirmScreen({super.key, required this.userModel});

  UserModel userModel;

  @override
  State<GmailConfirmScreen> createState() => _GmailConfirmScreenState();
}

class _GmailConfirmScreenState extends State<GmailConfirmScreen> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gmail Confirm"),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlobalTextField(
                hintText: "Code",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.start,
                onChanged: (v) {
                  code = v;
                },
              ),
              GlobalButton(
                title: "Confirm",
                onTap: () {
                  context.read<AuthCubit>().confirmGmail(code);
                },
              ),
              const SizedBox(height: 50)
            ],
          );
        },
        listener: (context, state) {
          if (state is AuthConfirmCodeSuccessState) {
            context.read<AuthCubit>().registerUser(widget.userModel);
          }

          if (state is AuthLoggedState) {
            context.read<UserDataCubit>().clearData();
            BlocProvider.of<ProfileCubit>(context).getUserData();
            Navigator.pushNamedAndRemoveUntil(
                context, RouteNames.tabBox, (c) => false);
          }

          if (state is AuthErrorState) {
            showErrorMessage(message: state.errorText, context: context);
          }
        },
      ),
    );
  }
}
