import 'package:b2e/responsive%20Ui/responsive_UI.dart';
import 'package:b2e/responsive%20Ui/responsive_color_constants.dart';
import 'package:b2e/responsive%20Ui/responsive_text_constant.dart';
import 'package:b2e/signIn_logIn/sign_in.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (!Responsive.isMobile(context))
                Expanded(
                    flex: 1,
                    child: Container(
                      height: double.infinity,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        gradientColor1,
                        gradientColor2,
                        gradientColor3,
                        gradientColor4,
                      ])),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            welcome,
                            style: TextStyle(
                              color: mindtreeLineColor,
                              fontSize: 64,
                            ),
                          ),
                          Text(
                            to,
                            style: TextStyle(
                              color: mindtreeLineColor,
                              fontSize: 64,
                            ),
                          ),
                          Text(
                            possible,
                            style: TextStyle(
                              color: mindtreeLineColor,
                              fontSize: 64,
                            ),
                          ),
                        ],
                      ),
                    )),
              Expanded(
                flex: 1,
                child: LoginMobile(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
