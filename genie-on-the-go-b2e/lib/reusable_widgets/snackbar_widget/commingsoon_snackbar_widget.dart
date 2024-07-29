// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CommingsoonSnackbarWidget {
  static void show(context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Row(
          children: [
            Text(
              "Feature Comming Soon",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(width: 7),
            Icon(
              Icons.mood,
              color: Colors.white,
              size: 30,
            )
          ],
        ),
        duration: Duration(milliseconds: 800),
        backgroundColor: Colors.purple.withOpacity(0.9),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(left: 100, right: 8, bottom: 725),
        padding: EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ));
  }
}
