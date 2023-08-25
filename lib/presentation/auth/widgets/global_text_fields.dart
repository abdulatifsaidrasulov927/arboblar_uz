import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GlobalTextField extends StatelessWidget {
  GlobalTextField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    required this.textAlign,
    this.obscureText = false,
    this.maxLine = 1,
    required this.onChanged,
  }) : super(key: key);

  final String hintText;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  TextAlign textAlign;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        textInputAction: textInputAction,
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: keyboardType,
        maxLines: maxLine,
        decoration: InputDecoration(
            hintText: hintText,
            labelText: hintText,
            errorStyle: const TextStyle(fontSize: 18.0),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(9.0)))),
      ),
    );
  }
}



// Container(
//       margin: EdgeInsets.symmetric(horizontal: 25.w),
//       decoration: BoxDecoration(color: Colors.white, boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.5),
//           blurRadius: 10.r,
//           offset: const Offset(5, 5),
//         )
//       ]),
//       child: TextField(
//         cursorColor: Color(0xFF4F8962),
//         maxLines: maxLine,
//         style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//             color: AppColors.c_0C1A30,
//             fontFamily: "DMSans"),
//         textAlign: textAlign,
//         textInputAction: textInputAction,
//         keyboardType: keyboardType,
//         obscureText: obscureText,
//         onChanged: onChanged,
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: AppColors.white,
//           hintText: hintText,
//           hintStyle: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               color: AppColors.c_0C1A30,
//               fontFamily: "DMSans"),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(width: 1, color: AppColors.white),
//           ),
//           disabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30),
//             borderSide: BorderSide(
//               width: 1,
//               color: AppColors.white,
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(
//               width: 1,
//               color: AppColors.white,
//             ),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(
//               width: 1,
//               color: AppColors.white,
//             ),
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(
//               width: 1,
//               color: AppColors.white,
//             ),
//           ),
//         ),
//       ),
//     );