import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MyTextField extends StatefulWidget {
  final controller;
  final String hintText;
  bool obsecureText;
  //final GlobalKey<FlutterPwValidatorState> validatorKey = GlobalKey<FlutterPwValidatorState>();
  MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obsecureText});

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  //final _formfield = GlobalKey<FormState>();
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
            suffixIcon: IconButton(
              icon: Icon(
                widget.obsecureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey.shade900,
              ),
              onPressed: () {
                setState(() {
                  widget.obsecureText = !widget.obsecureText;
                });
              },
            ),
            hintStyle: TextStyle(color: Colors.grey.shade900),
          ),
          validator: (password) {
            if (password!.length < 6) {
              return 'Password should be at least 6 characters';
            }
            return null;
          }),
    );
  }
}
