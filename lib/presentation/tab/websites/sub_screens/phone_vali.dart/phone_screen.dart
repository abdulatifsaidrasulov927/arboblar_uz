import 'package:arboblar_uz/presentation/tab/websites/sub_screens/phone_vali.dart/function_page.dart';
import 'package:arboblar_uz/presentation/tab/websites/sub_screens/phone_vali.dart/storge.dart';
import 'package:flutter/material.dart';
import 'package:phone_number/phone_number.dart';

class PhoneScreen extends StatelessWidget {
  final store = Store(PhoneNumberUtil());

  PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Number'),
      ),
      body: FunctionsPage(store),
    );
  }
}
