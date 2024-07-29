import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MyTextFieldMail extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obsecureText;
  // bool _obsecureText;
  const MyTextFieldMail(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obsecureText});

  @override
  State<MyTextFieldMail> createState() => _MyTextFieldMailState();
}

//final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _MyTextFieldMailState extends State<MyTextFieldMail> {
  // String? validateEmail(String? email) {
  //   const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
  //       r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
  //       r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
  //       r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
  //       r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
  //       r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
  //       r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  //   final regex = RegExp(pattern);

  //   return email!.isNotEmpty && !regex.hasMatch(email)
  //       ? 'Enter a valid email address'
  //       : null;
  // }

  // String? Validate(String? email) {
  //   bool isvalid = EmailValidator.validate(email);
  //   print(isvalid);
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
          controller: widget.controller,
          obscureText: widget.obsecureText,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade100),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.pink.shade50,
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey.shade900),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Enter Email";
            }
            bool emailValid = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                .hasMatch(value);
            if (!emailValid) {
              return "Enter Valid Email";
            }
            return null;
          }),
    );
  }
}
