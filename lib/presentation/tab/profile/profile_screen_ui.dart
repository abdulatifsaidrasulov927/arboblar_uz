import 'package:arboblar_uz/cubits/auth/auth_cubit.dart';
import 'package:arboblar_uz/cubits/profile/profile_cubit.dart';
import 'package:arboblar_uz/utils/constants/constants.dart';
import 'package:arboblar_uz/utils/ui_utils/custom_circular.dart';
import 'package:arboblar_uz/utils/ui_utils/error_message_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProfileScreenUi extends StatelessWidget {
  const ProfileScreenUi({super.key});

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
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .5,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.elliptical(
                                    MediaQuery.of(context).size.width * 0.5,
                                    100.0),
                                bottomRight: Radius.elliptical(
                                    MediaQuery.of(context).size.width * 0.5,
                                    100.0),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(baseUrl +
                                    state.userModel.avatar.substring(1)),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    state.userModel.username,
                                    style: const TextStyle(
                                      color: Color(0xffBDBDBD),
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ZoomTapAnimation(
                                onTap: () {},
                                child: const CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xffD8D8D8),
                                  child: Icon(
                                    Icons.chat,
                                    size: 30,
                                    color: Color(0xff6E6E6E),
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                radius: 70,
                                backgroundImage: NetworkImage(baseUrl +
                                    state.userModel.avatar.substring(1)),
                              ),
                              ZoomTapAnimation(
                                onTap: () {},
                                child: const CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xffD8D8D8),
                                  child: Icon(
                                    Icons.call,
                                    size: 30,
                                    color: Color(0xff6E6E6E),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Text(
                      'They say confidence is key, but I unlocked the whole damn vault Under this fierce exterior lies a heart of gold. Follow along for a taste of my unfiltered reality. Leaving timid souls trailing in my electrifying wake',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Role',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            state.userModel.role,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'contact',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            state.userModel.contact,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'gender',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            state.userModel.gender,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'user name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            state.userModel.username,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
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
