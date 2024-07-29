// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:b2e/reusable_widgets/app_bar_widget/appbar.dart';
import 'package:b2e/reusable_widgets/drawer_widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class DeveloperTeam extends StatelessWidget {
  const DeveloperTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Text(
              "Leadership",
              style: TextStyle(
                  fontSize: 18.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CardWidget(
                    image: "assets/images/profile.png",
                    name: "Somnath Chatterjee",
                    designation: "Senior Director",
                    email: "somnath.chatterjee@ltimindtree.com"),
                SizedBox(width: 10),
                CardWidget(
                    image: "assets/images/dev_team/img.jpg",
                    name: "Santanu Mukherjee",
                    designation: "Managing Principal",
                    email: "Santanu.Mukherjee@ltimindtree.com"),
              ],
            ),
            Text(
              "Lead",
              style: TextStyle(
                  fontSize: 18.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            SizedBox(height: 3),
            Row(
              children: [
                CardWidget(
                    image: "assets/images/dev_team/img 3.jpg",
                    name: "Shashi Kant",
                    designation: "Senior Specialist",
                    email: "shashi.kant@ltimindtree.com"),
              ],
            ),
            Text(
              "Developers",
              style: TextStyle(
                  fontSize: 18.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            SizedBox(height: 3),
            GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 227),
              children: [
                CardWidget(
                    image: "assets/images/dev_team/img 4.jpg",
                    name: "Kunal Chandra",
                    designation: "Software Engineer",
                    email: "kunal.chandra@ltimindtree.com"),
                CardWidget(
                    image: "assets/images/dev_team/img 5.png",
                    name: "Afiya Ansari",
                    designation: "Software Engineer",
                    email: "afiya.ansari@ltimindtree.com"),
                CardWidget(
                    image: "assets/images/dev_team/img 6.jpg",
                    name: "Deep Behera",
                    designation: "Software Engineer",
                    email: "deep.behera@ltimindtree.com"),
                CardWidget(
                    image: "assets/images/dev_team/img 7.png",
                    name: "Sarankumar Sivakumar",
                    designation: "Software Engineer",
                    email: "sarankumar.sivakumar@ltimindtree.com"),
                CardWidget(
                    image: "assets/images/dev_team/img 8.png",
                    name: "Gaurang Choudhary",
                    designation: "Software Engineer",
                    email: "gaurang.choudhary@ltimindtree.com"),
                CardWidget(
                    image: "assets/images/dev_team/img 9.png",
                    name: "Ajay P",
                    designation: "Software Engineer",
                    email: "ajay.p@ltimindtree.com"),
                CardWidget(
                    image: "assets/images/dev_team/img 10.png",
                    name: "A Prathaban",
                    designation: "Software Engineer",
                    email: "a.prathaban@ltimindtree.com"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.designation,
    required this.email,
  });

  final String image;
  final String name;
  final String designation;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 6),
        height: 222,
        width: 170,
        child: Column(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage(image),
            ),
            SizedBox(height: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  designation,
                  style: TextStyle(
                    fontSize: 13.5,
                    color: Colors.black,
                    // fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade600,
                      // fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.purple.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
