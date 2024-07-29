import 'package:b2e/reusable_widgets/app_bar_widget/appbar.dart';
import 'package:b2e/widgets/todays.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: Container(
          width: double.infinity,
          height: 900,
          margin: EdgeInsets.only(left: 5, right: 1, top: 8),
          decoration: BoxDecoration(color: Color.fromARGB(255, 253, 253, 253)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Today",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Todays(
                        data:
                            "Replace 'Peruvain Mocha standee with a 'Very Berry Reduced Fat Coffee' standee and reconfigure the service tag using Tag Management ",
                        image:
                            "assets/images/tagcontentmanagement/cap_coffee.jpg",
                        time: "10 minutes ago")
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "This Week",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Todays(
                        data: "Check the monthly Tag Analytics Report",
                        image:
                            "assets/images/tagcontentmanagement/analytics.png",
                        time: "2 days ago"),
                    Todays(
                        data:
                            "The Walnut Cookies Tent  Card is performing well have a look at the progress.",
                        image:
                            "assets/images/tagcontentmanagement/wallnut_cookies.jpg",
                        time: "3 days ago")
                  ],
                )
              ],
            ),
          )),
    );
  }
}
