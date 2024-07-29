// import 'package:b2e/home/home_home_page.dart';
// import 'package:b2e/screens/lop.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';

// class MyButton extends StatelessWidget {
//   final email;
//   final password;
//   MyButton({super.key, required this.email, required this.password});

//   List users = [
//     {"email": "abcd@gmail.com", "password": "111111", "role": "Zone Manager"},
//     {"email": "abcde@gmail.com", "password": "111111", "role": "Store Manager"},
//     {"email": "abcdef@gmail.com", "password": "111111", "role": "Store Manager"}
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // for (int i = 0; i < users.length; i++) {
//         //   if (users[i]["email"] == email && users[i]["password"] == password) {
//         //     var role = users[i]["role"];
//         //     Navigator.pushReplacement(
//         //         context,
//         //         MaterialPageRoute(
//         //             builder: (context) =>
//         //                 role == "Zone Manager" ? HomePage() : lop()));

//         //     break;
//         //   }
//         // }
//       },
//       child: Container(
//           padding: EdgeInsets.all(25),
//           margin: EdgeInsets.symmetric(horizontal: 25),
//           decoration: BoxDecoration(
//             color: Colors.purple.shade700,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Center(
//             child: Text(
//               'SIGN IN',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//           )),
//     );
//   }
// }
