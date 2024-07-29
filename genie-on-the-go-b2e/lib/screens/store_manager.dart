import 'package:b2e/home/home_home_page.dart';
import 'package:b2e/tagContentManagement/tag_content_management.dart';
import 'package:flutter/material.dart';
import '../reusable_widgets/app_bar_widget/appbar.dart';
import '../reusable_widgets/drawer_widget/drawer_widget.dart';
import '../tag_analytics/tag_tag_analytics.dart';

class StoreHomePage extends StatelessWidget {
  const StoreHomePage({super.key, required this.name});
  final name;

  @override
  Widget build(BuildContext context) {
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
                              "12 March, 2024",
                              style: TextStyle(
                                  color: Colors.purple.shade600,
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Store ID",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "CK0032",
                              style: TextStyle(
                                  color: Colors.purple.shade600,
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        )
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
                  imageName: "mobile_device_management",
                  title: "Tag Heat Map",
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TagContentManagement())),
                ),
                HomepageContainer(
                  imageName: "tag_analytics",
                  title: "Tag Analytics",
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TagAnalytic())),
                ),
                HomepageContainer(
                  imageName: "tag_content_management",
                  title: "Tag Content Management",
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TagContentManagement())),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
