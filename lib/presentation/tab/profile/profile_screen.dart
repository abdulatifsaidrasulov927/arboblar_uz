import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arboblar_uz/cubits/auth/auth_cubit.dart';
import 'package:arboblar_uz/cubits/profile/profile_cubit.dart';
import 'package:arboblar_uz/utils/constants/constants.dart';
import 'package:arboblar_uz/utils/ui_utils/custom_circular.dart';
import 'package:arboblar_uz/utils/ui_utils/error_message_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).logOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return const CustomCircularProgressIndicator();
          }
          if (state is ProfileSuccessState) {
            return Column(
              children: [
                Image.network(
                  baseUrl + state.userModel.avatar.substring(1),
                  width: 200,
                ),
                ListTile(
                  title: Text(
                    state.userModel.username,
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    state.userModel.email,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  title: Text(
                    state.userModel.role,
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    state.userModel.contact,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  title: Text(
                    state.userModel.id.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    state.userModel.gender,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            );
          }

          return const Text("ERROR");
        },
        listener: (context, state) {
          if (state is ProfileErrorState) {
            showErrorMessage(message: state.errorText, context: context);
          }
        },
      ),
    );
  }
}
