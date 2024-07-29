// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:b2e/reusable_widgets/drawer_widget/widget/drawer_copyright_widget.dart';
import 'package:flutter/material.dart';
import '../snackbar_widget/commingsoon_snackbar_widget.dart';
import 'widget/drawer_listTile_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              padding: EdgeInsets.zero,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1),
                        image: DecorationImage(
                            image: AssetImage("assets/images/mtap.png"))),
                  ),
                ),
              ),
            ),
            DrawerListTileWidget(
              text: 'Home',
              icon: Icons.home_rounded,
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/home");
              },
            ),
            DrawerListTileWidget(
              text: 'Tag Content Management',
              icon: Icons.recent_actors,
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/content");
              },
            ),
            DrawerListTileWidget(
              text: 'Tag Analytics',
              icon: Icons.insights,
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/analytics");
              },
            ),
            DrawerListTileWidget(
              text: 'Mobile Device Management',
              icon: Icons.phonelink_setup,
              onTap: () {
                CommingsoonSnackbarWidget.show(context);
              },
            ),
            DrawerListTileWidget(
              text: 'Application Configuration Management',
              icon: Icons.settings,
              onTap: () {
                CommingsoonSnackbarWidget.show(context);
              },
            ),
            DrawerListTileWidget(
              text: 'Role Based Access Control Management',
              icon: Icons.bar_chart,
              onTap: () {
                CommingsoonSnackbarWidget.show(context);
              },
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: DrawerCopyrightWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
