// ignore_for_file: prefer_const_constructors

import 'package:b2e/responsive%20Ui/responsive_UI.dart';
import 'package:b2e/reusable_widgets/app_bar_widget/appbar.dart';
import 'package:b2e/reusable_widgets/drawer_widget/customList.dart';
import 'package:b2e/reusable_widgets/drawer_widget/drawer_widget.dart';
import 'package:b2e/screens/tag_details.dart';
import 'package:b2e/tagContentManagement/clipper/offertag.dart';
import 'package:b2e/tagContentManagement/clipper/offertagimage.dart';

import 'package:b2e/tagContentManagement/edit_tagcontent.dart';
import 'package:b2e/services/data_fetching.dart';
import 'package:b2e/model/json_model.dart';
import 'package:b2e/tagContentManagement/tag_publish_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tagss extends StatefulWidget {
  const Tagss({super.key});

  @override
  State<Tagss> createState() => _TagssState();
}

class _TagssState extends State<Tagss> {
  List<JsonModel> value = [];

  String selectedValue1 = "";

  Future<void> fetchValue() async {
    value = await ApiService.fetchValueData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchValue();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const AppbarWidget(),
      drawer: !Responsive.isDesktop(context) ? const DrawerWidget() : null,
      // drawer:DrawerWidget(),
      body: Center(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 1,
                child: Container(
                    color: const Color.fromARGB(255, 101, 16, 116),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 25),
                          child: Image.asset(
                            "assets/images/mtap.png",
                            height: 120,
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 3,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Tagss()),
                            );
                          },
                          child: const DrawerList(
                              title: "Home", iconName: Icons.home_rounded),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Tagss()),
                            );
                          },
                          child: const DrawerList(
                              title: "Tag Content Management",
                              iconName: Icons.recent_actors),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Tagss()),
                            );
                          },
                          child: const DrawerList(
                              title: "Tag Analytics", iconName: Icons.insights),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Tagss()),
                            );
                          },
                          child: const DrawerList(
                              title: "Mobile Device Management",
                              iconName: Icons.phonelink_setup),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Tagss()),
                            );
                          },
                          child: const DrawerList(
                              title: "Application \nConfiguration Management",
                              iconName: Icons.settings),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Tagss()),
                            );
                          },
                          child: const DrawerList(
                              title: "Role Based Access \nControl Management",
                              iconName: Icons.bar_chart),
                        ),
                      ],
                    )),
              ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 209, 207, 207)),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.4,
                        crossAxisCount: screenWidth <= 625
                            ? 1
                            : (screenWidth < 915 && screenWidth > 625)
                                ? 2
                                : 3),
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Consumer<boolProvider>(
                        builder: (context, boolProviderModel, child) =>
                            Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/tagcontentmanagement/${value[index].image}.jpg'),
                                                      fit: BoxFit.cover)),
                                            ),
                                            Positioned(
                                              bottom: 4,
                                              left: 4,
                                              child: ClipPath(
                                                clipper: OfferTagClipperImage(),
                                                child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  color: boolProviderModel
                                                                  .publishBoolean[
                                                              index] ==
                                                          false
                                                      ? Colors.orange
                                                      : Colors
                                                          .green, // Change the color as desired
                                                  child: Text(
                                                    boolProviderModel
                                                                    .publishBoolean[
                                                                index] ==
                                                            false
                                                        ? 'work in Progress'
                                                        : 'Published',
                                                    style: TextStyle(
                                                      color: Colors
                                                          .white, // Change the text color as desired
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15, top: 25, left: 15),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '${value[index].tagnumber}',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text('|'),
                                                    Text(
                                                      '${value[index].itemcode}',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text('|'),
                                                    Flexible(
                                                      fit: FlexFit.loose,
                                                      child: Text(
                                                        '${value[index].name}',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Price:',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                        '\$${value[index].price}',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                                Text(
                                                    '${value[index].description}',
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    )),
                                                const Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Marketing Message',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Tap Your Phone here to place your order in an instant and avail the magic discount!',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 4,
                                  right: 4,
                                  child: Row(
                                    children: [
                                      Visibility(
                                        visible: boolProviderModel
                                            .publishBoolean[index],
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TagDetails(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 101, 16, 116),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "View",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Edit_tagcontent(
                                                itemname: value[index],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                137, 117, 113, 113),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "Edit",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: ClipPath(
                                    clipper: OfferTagClipper(),
                                    child: Container(
                                      padding: EdgeInsets.all(12),
                                      color: Colors
                                          .red, // Change the color as desired
                                      child: Text(
                                        'Standee',
                                        style: TextStyle(
                                          fontSize:
                                              Responsive.isDesktop(context)
                                                  ? 12
                                                  : 12 * 1,
                                          color: Colors
                                              .white, // Change the text color as desired
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
