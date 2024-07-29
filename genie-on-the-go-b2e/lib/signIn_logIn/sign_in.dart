import 'package:b2e/home/home_home_page.dart';
import 'package:b2e/responsive%20Ui/responsive_store_home.dart';
import 'package:b2e/responsive%20Ui/responsive_zone_home.dart';
import 'package:b2e/screens/lop.dart';
import 'package:b2e/screens/store_manager.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'widgets/button.dart';
import 'widgets/text_field.dart';
import 'widgets/text_field_mail.dart';

class LoginMobile extends StatefulWidget {
  LoginMobile({super.key});

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool passToggle = false;

  List users = [
    {
      "email": "robert@gmail.com",
      "name": "Robert",
      "password": "111111",
      "role": "Zone Manager"
    },
    {
      "email": "alex@gmail.com",
      "name": "Alex",
      "password": "111111",
      "role": "Store Manager"
    },
    {
      "email": "john@gmail.com",
      "name": "John",
      "password": "111111",
      "role": "Store Manager"
    }
  ];

  void signUserIn() {
    final isValidate = _formKey.currentState!.validate();
    print(isValidate);
    var found = -1;
    if (isValidate == true) {
      for (int i = 0; i < users.length; i++) {
        if (users[i]["email"] == emailController.text) {
          var role = users[i]["role"];
          if (users[i]["password"] == passwordController.text) {
            found = 1;
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => role == "Zone Manager"
                        ? ResponsiveZoneHome(name: users[i]["name"])
                        : ResponsiveStoreHome(name: users[i]["name"])));
          } else {
            found = 0;
          }
          break;
        }
      }

      if (found != 1) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.purple,
            content: Align(
              alignment: Alignment.topCenter,
              child: Text(
                found == -1 ? "User Not Found" : "Inavlid Credentials",
                style: TextStyle(fontSize: 21),
              ),
            ),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  // Image.asset(
                  //   'assets/images/mtap.png',
                  //   width: 200,
                  // ),
                  Image(
                    image: AssetImage(
                      'assets/images/mtap.png',
                    ),
                    width: 200,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(color: Colors.black, fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyTextFieldMail(
                    controller: emailController,
                    hintText: 'Email',
                    obsecureText: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obsecureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Forgot Password?',
                            style: TextStyle(color: Colors.grey.shade700)),
                      ],
                    ),
                  ),
                  SizedBox(height: 45),
                  GestureDetector(
                    onTap: () {
                      signUserIn();
                    },
                    child: Container(
                        padding: EdgeInsets.all(25),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade700,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
