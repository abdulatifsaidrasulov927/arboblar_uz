// import 'package:arboblar_uz/data/models/users/users_model.dart';
// import 'package:bloc/bloc.dart';

// class DynamicViewsCubit extends Cubit<DynamicViewsState> {
//   DynamicViewsCubit({required this.myRepository})
//       : super(
//           DynamicViewsState(
//             status: FormzStatus.pure,
//             fields: {},
//             dynamicFields: [],
//           ),
//         ) {
//     fetchDynamicFields();
//   }

//   final MyRepository myRepository;

//   void fetchDynamicFields() async {
//     emit(state.copyWith(status: FormzStatus.submissionInProgress));
//     try {
//       var myFields = await myRepository.getDynamicFields();
//       emit(
//         state.copyWith(
//           status: FormzStatus.submissionSuccess,
//           dynamicFields: myFields,
//           fields: makeValuesMap(myFields),
//         ),
//       );
//     } on MyCustomFieldsError catch (error) {
//       emit(state.copyWith(status: FormzStatus.submissionFailure));
//       print(error.errorText);
//     }
//   }

//   Map<String, dynamic> makeValuesMap(List<UsersModel> dynamicFields) {
//     Map<String, dynamic> valuesMap = {};
//     for (var value in dynamicFields) {
//       valuesMap[value.code] = value.initialValue;
//     }
//     return valuesMap;
//   }

//   updateSingleFieldValue({
//     required String code,
//     required String value,
//   }) {
//     var oldFields = state.fields;
//     oldFields[code] = value;
//     emit(state.copyWith(fields: oldFields));
//     debugPrint("CURRENT VALUES:$oldFields");
//   }
// }
