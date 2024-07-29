import 'package:b2e/widgets/Tage_details_2nd_tablel_abel.dart';
import 'package:b2e/widgets/Tagedetails_row.dart';

import 'package:flutter/material.dart';

class TagDetails extends StatefulWidget {
  const TagDetails({super.key});

  @override
  State<TagDetails> createState() => _TagDetailsState();
}

class _TagDetailsState extends State<TagDetails> {
  var actcolor = MaterialStatePropertyAll(Color.fromARGB(248, 211, 226, 233));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tag Details"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        //  margin: EdgeInsets.all(1.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Container(
            //   margin: EdgeInsets.only(bottom: 5),
            //   padding: EdgeInsets.only(left: 10),
            //   child: Row(
            //     children: [
            //       Text(
            //         "Tag Content Management",
            //         style: TextStyle(color: Colors.purple),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.only(left: 3, right: 3),
            //         child: Text("/"),
            //       ),
            //       Text("Tag Details")
            //     ],
            //   ),
            //   height: 29,
            //   width: double.infinity,
            //   color: Color.fromARGB(255, 221, 221, 221),
            // ),
            Text(
              "Tag Details",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 11, left: 7, right: 3.5),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 148, 143, 143),
                          blurRadius: 5,
                          spreadRadius: 3,
                          offset: Offset(4, 4)),
                      // BoxShadow(
                      //     color: Color.fromARGB(255, 148, 143, 143),
                      //     blurRadius: 5,
                      //     spreadRadius: 3,
                      //     offset: Offset(-1, 1)),
                      BoxShadow(
                          color: Color.fromARGB(255, 148, 143, 143),
                          blurRadius: 1,
                          spreadRadius: 0.5,
                          offset: Offset(-3, 0)),
                      BoxShadow(
                          color: Color.fromARGB(255, 148, 143, 143),
                          blurRadius: 5,
                          spreadRadius: 3,
                          offset: Offset(2, 0))
                    ]),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8, top: 5),
                        padding: EdgeInsets.only(left: 9),
                        child: Text(
                          "Product Details",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 3, bottom: 3, left: 4, right: 4),
                        decoration: BoxDecoration(
                            color: Colors.purple,

                            // color: Color.fromARGB(255, 240, 243, 245),
                            border: Border.all(
                                color: Color.fromARGB(255, 109, 105, 105),
                                width: 1)),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            child: DataTable(columns: [
                              DataColumn(
                                  label: Text(
                                "Name",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )),
                              DataColumn(
                                  label: Text("Shop Code",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18))),
                              DataColumn(
                                  label: Text("Price",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18))),
                              DataColumn(
                                  label: Text("Start Date",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18))),
                              DataColumn(
                                  label: Text("End Date",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)))
                            ], rows: [
                              DataRow(
                                  color: MaterialStatePropertyAll(
                                      Color.fromARGB(255, 255, 255, 255)),
                                  cells: [
                                    DataCell(Text(
                                      "Mocha",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )),
                                    DataCell(Text(
                                      "CM1023",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )),
                                    DataCell(Text(
                                      "120.0",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )),
                                    DataCell(Text(
                                      "01/02/2024",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )),
                                    DataCell(Text(
                                      "03/02/2024",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ))
                                  ])
                            ]),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // color: Color.fromARGB(255, 247, 245, 245),
                              border: Border.all(
                                  width: 2,
                                  color: Color.fromARGB(255, 161, 153, 153))),
                          margin: EdgeInsets.only(
                              top: 18, bottom: 3, left: 4, right: 4),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          width: double.infinity,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TagsLabel(),
                                  Expanded(
                                      child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      children: [
                                        TagActivated(),
                                        TagActivated(
                                          active: false,
                                        ),
                                        TagActivated(),
                                        TagActivated(),
                                        TagActivated(
                                          active: false,
                                        ),
                                        TagActivated(),
                                        TagActivated(),
                                        TagActivated(
                                          active: false,
                                        ),
                                        TagActivated(
                                          active: false,
                                        ),
                                        TagActivated(),
                                        TagActivated(
                                          active: false,
                                        )
                                      ],
                                    ),
                                  ))
                                  // Container(
                                  //   height: 600,
                                  //   child: ListView.builder(
                                  //       itemCount: 13,
                                  //       itemBuilder: (context, index) {
                                  //         return TageDetailsRow();
                                  //       }),
                                  // )

                                  // Container(
                                  //     height: 40,
                                  //     width: 90,
                                  //     color: Colors.black)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
         // DataTable(
                                          //     columns: [
                                          //       Datacol(title: "Published On")
                                          //           .datacol(),
                                          //       Datacol(title: "Zone")
                                          //           .datacol(),
                                          //       Datacol(title: "Area")
                                          //           .datacol(),
                                          //       Datacol(title: "Store ID")
                                          //           .datacol(),
                                          //       Datacol(title: "Status")
                                          //           .datacol(),
                                          //       Datacol(title: "Achieved On On")
                                          //           .datacol(),
                                          //       Datacol(title: "Action")
                                          //           .datacol(),
                                          //     ],
                                          //     rows: [ListView.builder(
                                          //         itemCount: 11,
                                          //         itemBuilder:
                                          //             (context, index) {
                                          //           return Datarow(
                                          //                   actcolor: actcolor)
                                          //               .activated();
                                          //         })]

                                              // [
                                              //   Datarow(actcolor: actcolor)
                                              //       .activated(),
                                              //   Datarow(actcolor: actcolor)
                                              //       .notactivated(),
                                              //   Datarow(actcolor: actcolor)
                                              //       .notactivated(),
                                              //   Datarow(actcolor: actcolor)
                                              //       .notactivated(),
                                              //   Datarow(actcolor: actcolor)
                                              //       .notactivated(),
                                              //   Datarow(actcolor: actcolor)
                                              //       .notactivated(),
                                              //   Datarow(actcolor: actcolor)
                                              //       .activated(),
                                              //   Datarow(actcolor: actcolor)
                                              //       .notactivated(),
                                              //   Datarow(actcolor: actcolor)
                                              //       .notactivated(),
                                              //   Datarow(actcolor: actcolor)
                                              //       .activated(),
                                              //   Datarow(actcolor: actcolor)
                                              //       .notactivated(),
                                              //   Datarow(actcolor: actcolor)
                                              //       .activated(),
                                              //   Datarow(actcolor: actcolor)
                                              //       .activated(),
                                              // ]