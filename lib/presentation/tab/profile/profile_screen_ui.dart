import 'package:arboblar_uz/cubits/auth/auth_cubit.dart';
import 'package:arboblar_uz/cubits/profile/profile_cubit.dart';
import 'package:arboblar_uz/utils/constants/constants.dart';
import 'package:arboblar_uz/utils/ui_utils/custom_circular.dart';
import 'package:arboblar_uz/utils/ui_utils/error_message_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                          padding: const EdgeInsets.only(bottom: 40.0),
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
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: Icon(
                                  Icons.close,
                                  color: Color(0xffC3C3C3),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    state.userModel.username,
                                    style: TextStyle(
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
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xffD8D8D8),
                                child: Icon(
                                  Icons.chat,
                                  size: 30,
                                  color: Color(0xff6E6E6E),
                                ),
                              ),
                              CircleAvatar(
                                radius: 70,
                                backgroundImage: NetworkImage(baseUrl +
                                    state.userModel.avatar.substring(1)),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xffD8D8D8),
                                child: Icon(
                                  Icons.call,
                                  size: 30,
                                  color: Color(0xff6E6E6E),
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
                      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        state.userModel.role,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '|',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Dev',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '|',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Android',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '|',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Travel',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
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
