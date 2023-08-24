// import 'dart:convert';
// import 'dart:io';

// import 'package:arboblar_uz/data/models/users/users_model.dart';
// import 'package:dio/dio.dart';

// class UsersRepository {
//   Future getDynamicFields() async {
//     var dio = Dio();
//     try {
//       Response response =
//           await dio.get("https://dynamic-view-api.free.mockoapp.net/dynamic");

//       if (response.statusCode == HttpStatus.ok) {
//         print(response.data);
//         return (jsonDecode(response.data) as List?)
//                 ?.map((e) => UsersModel.fromJson(e))
//                 .toList() ??
//             [];
//       }
//       return response.data;
//     } catch (error) {
//       print(error);
//       throw MyCustomFieldsError(errorText: error.toString());
//     }
//   }
// }

// class MyCustomFieldsError implements Exception {
//   final String errorText;
//   MyCustomFieldsError({required this.errorText});
// }

// (jsonDecode(response.data) as List?)
//                 ?.map((e) => UsersModel.fromJson(e))
//                 .toList() ??
//             [];

// import 'package:arboblar_uz/data/models/users/users_model.dart';
// import 'package:dio/dio.dart';

// Future<UsersModel> RepostoryDioExample() async {
//   final dio = Dio();
//   final response = await dio.get('https://fifth-exam.free.mockoapp.net/users');
//   return response.data;
// }
import 'dart:convert';

import 'package:arboblar_uz/data/models/users/users_model.dart';
import 'package:http/http.dart' as http;

Future<List<UsersModel>> fetchData() async {
  var url = Uri.parse('https://fifth-exam.free.mockoapp.net/users');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => UsersModel.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
