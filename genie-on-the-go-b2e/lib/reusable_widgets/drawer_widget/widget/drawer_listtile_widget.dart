// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DrawerListTileWidget extends StatelessWidget {
  const DrawerListTileWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: Colors.purple,
          size: 27,
        ),
        title: Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
