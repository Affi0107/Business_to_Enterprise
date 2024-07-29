// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:b2e/responsive%20Ui/responsive_UI.dart';
import 'package:b2e/responsive%20Ui/responsive_tag_content.dart';
import 'package:flutter/material.dart';
import '../reusable_widgets/app_bar_widget/appbar.dart';
import '../reusable_widgets/drawer_widget/drawer_widget.dart';
import '../reusable_widgets/snackbar_widget/commingsoon_snackbar_widget.dart';
import '../tag_analytics/tag_tag_analytics.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.name});
  final name;

  final DateTime currentDateTime = DateTime.now();
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  Widget build(BuildContext context) {
    int year = currentDateTime.year;
    String month = months[currentDateTime.month - 1];
    int day = currentDateTime.day;
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerWidget(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: Offset(0, 5))
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Good Morning, $name",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.5,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Date",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "$day $month $year",
                              style: TextStyle(
                                  color: Colors.purple.shade600,
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        // SizedBox(width: 12),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.end,
                        //   children: [
                        //     Text(
                        //       "Store ID",
                        //       style: TextStyle(
                        //           color: Colors.grey.shade700,
                        //           fontWeight: FontWeight.w600),
                        //     ),
                        //     SizedBox(height: 3),
                        //     Text(
                        //       "CK0032",
                        //       style: TextStyle(
                        //           color: Colors.purple.shade600,
                        //           fontSize: 15.5,
                        //           fontWeight: FontWeight.w700),
                        //     ),
                        //   ],
                        // )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                HomepageContainer(
                  imageName: "tag_content_management",
                  title: "Tag Content Management",
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Tagss())),
                ),
                HomepageContainer(
                  imageName: "tag_analytics",
                  title: "Tag Analytics",
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TagAnalytic())),
                ),
                HomepageContainer(
                    imageName: "mobile_device_management",
                    title: "Mobile Device Management",
                    onTap: () {
                      CommingsoonSnackbarWidget.show(context);
                    }),
                HomepageContainer(
                    imageName: "application_configuration_management",
                    title: "Application Configuration Management",
                    onTap: () {
                      CommingsoonSnackbarWidget.show(context);
                    }),
                HomepageContainer(
                    imageName: "access_control_management",
                    title: "Role Based Access Control Management",
                    onTap: () {
                      CommingsoonSnackbarWidget.show(context);
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HomepageContainer extends StatelessWidget {
  const HomepageContainer(
      {super.key,
      required this.imageName,
      required this.title,
      required this.onTap});
  final String imageName;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double homeContainerHeight = !Responsive.isMobile(context) ? 380 : 180;
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: homeContainerHeight,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage("assets/images/$imageName.jpg"),
                    fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: Offset(0, 5))
                ]),
          ),
          Container(
            height: homeContainerHeight,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(13)),
              gradient: LinearGradient(colors: [
                Colors.transparent,
                Colors.transparent.withOpacity(0.5),
                Colors.purple,
              ], begin: Alignment.center, end: Alignment.bottomCenter),
            ),
          ),
          Container(
            height: homeContainerHeight,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(13)),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
