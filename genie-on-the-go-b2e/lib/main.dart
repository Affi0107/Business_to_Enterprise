// ignore_for_file: prefer_const_constructors

import 'package:b2e/responsive%20Ui/responsive_login.dart';
import 'package:b2e/routing/router.dart';
import 'package:b2e/tagContentManagement/tag_publish_provider.dart';
import 'package:b2e/tag_analytics/provider/provider_tag_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => boolProvider()),
        ChangeNotifierProvider(create: (context) => TagAnalyticProvider())
      ],
      child: MaterialApp(
        title: "B2E",
        debugShowCheckedModeBanner: false,
        home: Login(),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
