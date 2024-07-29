// ignore_for_file: prefer_const_constructors

import 'package:b2e/responsive%20Ui/responsive_UI.dart';
import 'package:flutter/material.dart';
import '../snackbar_widget/commingsoon_snackbar_widget.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.purple,
      title: Row(
        children: [
          Image.asset(
            "assets/images/mtap.png",
            height: 35,
            // alignment: Alignment.centerLeft,
          ),
          SizedBox(width: Responsive.isMobile(context) ? 7 : 12),
          Text(
            "Mind Tap",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  CommingsoonSnackbarWidget.show(context);
                },
                icon: Icon(
                  Icons.search,
                  size: 25,
                )),
            SizedBox(width: Responsive.isMobile(context) ? 0 : 10),
            IconButton(
                onPressed: () {
                  CommingsoonSnackbarWidget.show(context);
                },
                icon: Icon(
                  Icons.notifications,
                  size: 25,
                )),
            SizedBox(width: Responsive.isMobile(context) ? 0 : 10),
            Material(
              shape: CircleBorder(),
              color: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                  onTap: () {
                    CommingsoonSnackbarWidget.show(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage("assets/images/profile.png"),
                    ),
                  )),
            ),
            SizedBox(width: Responsive.isMobile(context) ? 0 : 10),
          ],
        )
      ],
    );
  }
}
