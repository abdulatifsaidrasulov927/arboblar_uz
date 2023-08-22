import 'package:arboblar_uz/presentation/auth/widgets/global_text_fields.dart';
import 'package:flutter/material.dart';

class CodeInput extends StatelessWidget {
  const CodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GlobalTextField(
          hintText: "Code",
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          textAlign: TextAlign.center,
          controller: TextEditingController(),
        ),
      ],
    );
  }
}