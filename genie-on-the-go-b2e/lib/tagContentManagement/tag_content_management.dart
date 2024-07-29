// ignore_for_file: prefer_const_constructors

import 'package:b2e/reusable_widgets/app_bar_widget/appbar.dart';
import 'package:b2e/reusable_widgets/drawer_widget/drawer_widget.dart';
import 'package:b2e/screens/tag_details.dart';
import 'package:b2e/tagContentManagement/clipper/offertag.dart';
import 'package:b2e/tagContentManagement/clipper/offertagimage.dart';
import 'package:b2e/tagContentManagement/edit_tagcontent.dart';
import 'package:b2e/services/data_fetching.dart';
import 'package:b2e/model/json_model.dart';
import 'package:b2e/tagContentManagement/tag_publish_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../reusable_widgets/snackbar_widget/commingsoon_snackbar_widget.dart';

class TagContentManagement extends StatefulWidget {
  const TagContentManagement({super.key});

  @override
  State<TagContentManagement> createState() => _TagContentManagementState();
}

class _TagContentManagementState extends State<TagContentManagement> {
  List<JsonModel> value = [];

  String selectedValue1 = "";

  Future<void> fetchValue() async {
    value = await ApiService.fetchValueData();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(),
        drawer: DrawerWidget(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tags Details",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  ),
                  OutlinedButton(
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        side: MaterialStatePropertyAll(
                            BorderSide(color: Colors.purple, width: 2.5)),
                        foregroundColor:
                            MaterialStatePropertyAll(Colors.purple),
                      ),
                      onPressed: () {
                        CommingsoonSnackbarWidget.show(context);
                      },
                      child: Text(
                        "Add Tag",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      )),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Stack(children: [
                    Consumer<boolProvider>(
                      builder: (context, boolProviderModel, child) => Container(
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3))
                        ]),
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Stack(children: [
                                Container(
                                    margin: EdgeInsets.only(top: 30),
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context)
                                        .size
                                        .height, // Adjust the percentage as needed
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/tagcontentmanagement/${value[index].image}.jpg'),
                                      fit: BoxFit.cover,
                                    )),
                                Positioned(
                                  bottom: 4,
                                  left: 4,
                                  child: ClipPath(
                                    clipper: OfferTagClipperImage(),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      color: boolProviderModel
                                                  .publishBoolean[index] ==
                                              false
                                          ? Colors.orange
                                          : Colors
                                              .green, // Change the color as desired
                                      child: Text(
                                        boolProviderModel
                                                    .publishBoolean[index] ==
                                                false
                                            ? 'work in Progress'
                                            : 'Published',
                                        style: TextStyle(
                                          color: Colors
                                              .white, // Change the text color as desired
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              // Details Section
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(16.0),
                                  color: Colors
                                      .white, // Adjust the background color as needed
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${value[index].tagnumber}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text('|'),
                                          Text(
                                            '${value[index].itemcode}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text('|'),
                                          Flexible(
                                            fit: FlexFit.loose,
                                            child: Text(
                                              '${value[index].name}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Price:',
                                          ),
                                          Text('\$${value[index].price}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Text('${value[index].description}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Marketing Message'),
                                          Text(
                                              'Tap Your Phone here to place your order in an instant and avail the magic discount!',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.purple)),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Edit_tagcontent(
                                                            itemname:
                                                                value[index],
                                                          )));
                                            },
                                            child: Text(
                                              'Edit',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          Visibility(
                                            visible: boolProviderModel
                                                .publishBoolean[index],
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                              Color>(
                                                          Colors.purple)),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            TagDetails()));
                                              },
                                              child: Text(
                                                'view',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                      
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Image Container (60-70% of screen width)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: ClipPath(
                        clipper: OfferTagClipper(),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.red, // Change the color as desired
                          child: const Text(
                            'Standee',
                            style: TextStyle(
                              color: Colors
                                  .white, // Change the text color as desired
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]);
                },
              ),
            ),
          ],
        ));
  }
}
