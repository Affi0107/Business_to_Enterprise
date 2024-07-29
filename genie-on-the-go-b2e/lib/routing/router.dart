// ignore_for_file: prefer_const_constructors

import 'package:b2e/home/home_home_page.dart';
import 'package:b2e/signIn_logIn/sign_in.dart';
import 'package:b2e/tagContentManagement/tag_content_management.dart';
import 'package:b2e/tag_analytics/tag_tag_analytics.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginMobile());
      case '/home':
        return MaterialPageRoute(
            builder: (_) => HomePage(
                  name: null,
                ));

      case '/analytics':
        return MaterialPageRoute(builder: (_) => TagAnalytic());

      case '/content':
        return MaterialPageRoute(builder: (_) => TagContentManagement());
    }

    throw AboutListTile();
  }
}
