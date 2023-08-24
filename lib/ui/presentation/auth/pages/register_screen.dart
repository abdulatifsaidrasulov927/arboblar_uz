import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:arboblar_uz/cubits/auth/auth_cubit.dart';
import 'package:arboblar_uz/data/models/user/user_model.dart';
import 'package:arboblar_uz/ui/presentation/app_routes.dart';
import 'package:arboblar_uz/ui/presentation/auth/widgets/gender_selector.dart';
import 'package:arboblar_uz/utils/colors/app_colors.dart';
import 'package:arboblar_uz/utils/ui_utils/error_message_dialog.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController gmailController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ImagePicker picker = ImagePicker();

  XFile? file;

  int gender = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Registation"),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(builder: (context, state) {
        if (state is AuthLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 12),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: usernameController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    hintText: 'Username',
                    labelText: 'user named',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    errorStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.phone,
                controller: phoneController,
                decoration: const InputDecoration(
                    hintText: 'Mobile',
                    labelText: 'Mobile',
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9)))),
              ),
            ),
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
                        borderRadius: BorderRadius.all(Radius.circular(9.0)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: professionController,
                decoration: const InputDecoration(
                    hintText: 'Profession',
                    labelText: 'Profession',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    errorStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0)))),
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
                        borderRadius: BorderRadius.all(Radius.circular(9.0)))),
              ),
            ),
            const SizedBox(height: 20),
            GenderSelector(
              onMaleTap: () {
                setState(() {
                  gender = 1;
                });
              },
              onFemaleTap: () {
                setState(() {
                  gender = 0;
                });
              },
              gender: gender,
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    'Select image',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  onPressed: () {
                    showBottomSheetDialog();
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
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RouteNames.loginScreen);
                  },
                ),
              ),
            )),
            const SizedBox(height: 20),
            Center(
                child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  onPressed: () {
                    if (file != null &&
                        usernameController.text.isNotEmpty &&
                        phoneController.text.isNotEmpty &&
                        gmailController.text.isNotEmpty &&
                        professionController.text.isNotEmpty &&
                        passwordController.text.length > 5) {
                      context.read<AuthCubit>().sendCodeToGmail(
                            gmailController.text,
                            passwordController.text,
                          );
                    }
                  },
                ),
              ),
            )),
          ],
        );
      }, listener: (context, state) {
        if (state is AuthSendCodeSuccessState) {
          UserModel userModel = UserModel(
            password: passwordController.text,
            username: usernameController.text,
            email: gmailController.text,
            avatar: file!.path,
            contact: phoneController.text,
            gender: gender.toString(),
            profession: professionController.text,
            role: "male",
          );
          Navigator.pushNamed(
            context,
            RouteNames.confirmGmail,
            arguments: userModel,
          );
        }

        if (state is AuthErrorState) {
          showErrorMessage(message: state.errorText, context: context);
        }
      }),
    );
  }

  void showBottomSheetDialog() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.white,
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  _getFromCamera();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text(
                  "Camera",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ListTile(
                onTap: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.photo),
                title: const Text(
                  "Gallery",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _getFromCamera() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 512,
      maxWidth: 512,
    );

    if (xFile != null) {
      file = xFile;
    }
  }

  Future<void> _getFromGallery() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (xFile != null) {
      file = xFile;
    }
  }
}
