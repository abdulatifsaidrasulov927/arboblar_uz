// import 'package:flutter/material.dart';
// import 'package:arboblar_uz/presentation/app_routes.dart';

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key, required this.onChanged});

//   final VoidCallback onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         SizedBox(height: MediaQuery.of(context).size.height / 12),
//         TextButton(
//           onPressed: () {
//             onChanged.call();
//           },
//           child: const Text(
//             "Ligin",
//             style: TextStyle(
//                 color: Color(0xFF4F8962),
//                 fontSize: 18,
//                 fontWeight: FontWeight.w800),
//           ),
//         ),
// TextButton(
//   onPressed: () {
//     Navigator.pushNamed(context, RouteNames.confirmGmail);
//   },
//   child: const Text(
//     "First Confirm your",
//     style: TextStyle(
//         color: Color(0xFF4F8962),
//         fontSize: 18,
//         fontWeight: FontWeight.w800),
//   ),
// ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key, required this.onChanged}) : super(key: key);

  final VoidCallback onChanged;
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Map userData = {};
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter first Name',
                        labelText: 'first named',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        errorStyle: TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(9.0)))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter last Name',
                        labelText: 'Last named',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        errorStyle: TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(9.0)))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(9.0)))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Mobile',
                        labelText: 'Mobile',
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(9)))),
                  ),
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                    // margin: const EdgeInsets.fromLTRB(200, 20, 50, 0),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          print('form submiitted');
                          // widget.onChanged.call();
                        }
                      },
                    ),
                  ),
                )),
                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 100, right: 10),
                    child: Center(
                      child: Row(
                        children: [
                          const Text(
                            'Or ',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Sign In',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.blue),
                            ),
                          ),
                          const Text(
                            ' Using',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // TextButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, RouteNames.confirmGmail);
                //   },
                //   child: const Text(
                //     "First Confirm your",
                //     style: TextStyle(
                //         color: Color(0xFF4F8962),
                //         fontSize: 18,
                //         fontWeight: FontWeight.w800),
                //   ),
                // ),
              ],
            )),
      ),
    );
  }
}
