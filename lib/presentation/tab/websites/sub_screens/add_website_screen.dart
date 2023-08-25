import 'package:arboblar_uz/main.dart';
import 'package:arboblar_uz/presentation/tab/websites/sub_screens/phone_vali.dart/function_page.dart';
import 'package:arboblar_uz/presentation/tab/websites/sub_screens/phone_vali.dart/storge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:arboblar_uz/cubits/website/website_cubit.dart';
import 'package:arboblar_uz/data/models/websites/website_field_keys.dart';
import 'package:arboblar_uz/utils/colors/app_colors.dart';
import 'package:arboblar_uz/utils/ui_utils/error_message_dialog.dart';
import 'package:phone_number/phone_number.dart';

class AddWebsiteScreen extends StatefulWidget {
  const AddWebsiteScreen({super.key});

  @override
  State<AddWebsiteScreen> createState() => _AddWebsiteScreenState();
}

class _AddWebsiteScreenState extends State<AddWebsiteScreen> {
  ImagePicker picker = ImagePicker();
  final store = Store(PhoneNumberUtil());
  late WebsiteCubit bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<WebsiteCubit>(context);
    super.initState();
  }

  TextEditingController phoneController = phoneControllerMain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Website "),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                bloc.updateWebsiteField(
                  fieldKey: WebsiteFieldKeys.link,
                  value: value,
                );
              },
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: const InputDecoration(
                  hintText: 'website',
                  labelText: 'website',
                  errorStyle: TextStyle(fontSize: 18.0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(9.0)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                bloc.updateWebsiteField(
                  fieldKey: WebsiteFieldKeys.name,
                  value: value,
                );
              },
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: const InputDecoration(
                  hintText: 'example Daryo website',
                  labelText: 'wesite',
                  errorStyle: TextStyle(fontSize: 18.0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(9.0)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                bloc.updateWebsiteField(
                  fieldKey: WebsiteFieldKeys.author,
                  value: value,
                );
              },
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: const InputDecoration(
                  hintText: 'example Falokat',
                  labelText: 'title',
                  errorStyle: TextStyle(fontSize: 18.0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(9.0)))),
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.push(context, MaterialPageRoute(builder: (context) {
          //         return PhoneScreen();
          //       }));
          //     },
          //     child: IgnorePointer(
          //       child: TextFormField(
          //         controller: phoneController,
          //         onChanged: (value) {
          //           bloc.updateWebsiteField(
          //             fieldKey: WebsiteFieldKeys.contact,
          //             value: phoneController,
          //           );
          //         },
          //         decoration: const InputDecoration(
          //           labelText: 'add Phone',
          //           helperText: '',
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: TextFormField(
          //     textInputAction: TextInputAction.next,
          //     onChanged: (value) {
          //       bloc.updateWebsiteField(
          //         fieldKey: WebsiteFieldKeys.contact,
          //         value: value,
          //       );
          //     },
          //     keyboardType: TextInputType.text,
          //     maxLines: 1,
          //     decoration: const InputDecoration(
          //         hintText: 'example 947191205',
          //         labelText: 'phone number',
          //         errorStyle: TextStyle(fontSize: 18.0),
          //         border: OutlineInputBorder(
          //             borderSide: BorderSide(color: Colors.red),
          //             borderRadius: BorderRadius.all(Radius.circular(9.0)))),
          //   ),
          // ),
          FunctionsPage(store),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                bloc.updateWebsiteField(
                  fieldKey: WebsiteFieldKeys.hashtag,
                  value: value,
                );
              },
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: const InputDecoration(
                  hintText: 'example #talim',
                  labelText: 'hashtag',
                  errorStyle: TextStyle(fontSize: 18.0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(9.0)))),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    showBottomSheetDialog();
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                      elevation: const MaterialStatePropertyAll<double>(10),
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(Colors.blue)),
                  child: const Text('select Image'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 57,
                width: 326,
                child: ElevatedButton(
                  onPressed: () {
                    if (bloc.state.canAddWebsite()) {
                      //showErrorMessage(message: "Yaroqli!!!", context: context);
                      bloc.createWebsite();
                    } else {
                      showErrorMessage(
                          message: "Ma'lumotlar to'liq emas!!!",
                          context: context);
                    }
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                      elevation: const MaterialStatePropertyAll<double>(10),
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(Colors.blue)),
                  child: const Text('add website'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
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
            color: AppColors.c_162023,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  _getFromCamera();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text("Select from Camera"),
              ),
              ListTile(
                onTap: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.photo),
                title: const Text("Select from Gallery"),
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

    if (xFile != null && context.mounted) {
      bloc.updateWebsiteField(
        fieldKey: WebsiteFieldKeys.image,
        value: xFile.path,
      );
    }
  }

  Future<void> _getFromGallery() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (xFile != null && context.mounted) {
      bloc.updateWebsiteField(
        fieldKey: WebsiteFieldKeys.image,
        value: xFile.path,
      );
    }
  }
}
