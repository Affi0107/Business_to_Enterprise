import 'package:b2e/home/home_home_page.dart';
import 'package:b2e/responsive%20Ui/responsive_UI.dart';
import 'package:b2e/responsive%20Ui/responsive_tag_content.dart';
import 'package:b2e/reusable_widgets/app_bar_widget/appbar.dart';
import 'package:b2e/reusable_widgets/snackbar_widget/commingsoon_snackbar_widget.dart';
import 'package:b2e/tag_analytics/tag_tag_analytics.dart';
import 'package:flutter/material.dart';

class ResponsiveZoneHome extends StatelessWidget {
  ResponsiveZoneHome({super.key, this.name});
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
    print(currentDateTime.hour);
    String dayTime = currentDateTime.hour < 12
        ? "Good Morning"
        : currentDateTime.hour >= 12 && currentDateTime.hour < 17
            ? "Good Afternoon"
            : "Good Evening";

    int year = currentDateTime.year;
    String month = months[currentDateTime.month - 1];
    int day = currentDateTime.day;
    print(MediaQuery.of(context).size.width);
    double screenWidth = MediaQuery.of(context).size.width;
    double logoHeight = !Responsive.isMobile(context) ? 190 : 100;
    double titleFontSize = !Responsive.isMobile(context) ? 70 : 30;
    return Scaffold(
      appBar: const AppbarWidget(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 120, 12, 139),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset(
                      "assets/images/mtap.png",
                      height: logoHeight,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  SizedBox(
                    width: !Responsive.isMobile(context) ? 20 : 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Mind Tap",
                        style: TextStyle(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 5,
                      ),
                      Text(
                        "$dayTime, $name",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.5,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Date: $day $month $year",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: screenWidth <= 625
                  ? 1
                  : (screenWidth < 1281 && screenWidth > 625)
                      ? 3
                      : 5,
              crossAxisSpacing: 5,
              childAspectRatio: !Responsive.isMobile(context) ? 1 : 2,
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
          ),
        ],
      ),
    );
  }
}
