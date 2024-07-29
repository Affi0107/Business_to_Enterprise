// ignore_for_file: prefer_const_constructors

import 'package:b2e/reusable_widgets/app_bar_widget/appbar.dart';
import 'package:b2e/reusable_widgets/snackbar_widget/commingsoon_snackbar_widget.dart';
import 'package:b2e/screens/tag_details.dart';
import 'package:b2e/tagContentManagement/tag_content_management.dart';
import 'package:b2e/model/json_model.dart';
import 'package:b2e/tagContentManagement/tag_publish_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../reusable_widgets/drawer_widget/drawer_widget.dart';

class Edit_tagcontent extends StatefulWidget {
  Edit_tagcontent({super.key, required this.itemname});
  JsonModel itemname;

  @override
  State<Edit_tagcontent> createState() => _Edit_tagcontentState();
}

class _Edit_tagcontentState extends State<Edit_tagcontent> {
  TextEditingController _controller_name = TextEditingController();
  TextEditingController _controller_description = TextEditingController();
  TextEditingController _controller_tagnumber = TextEditingController();
  TextEditingController _controller_itemcode = TextEditingController();
  TextEditingController _controller_itemprice = TextEditingController();
  final TextEditingController _controller_marketing_message = TextEditingController(
      text:
          'Tap Your Phone here to place your order in an instant and avail the magic discount!');

  String selectedValue = 'option1';
  String selectedValue1 = 'option 1';

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));
  bool isSaveEnabled = true;
  bool isPublishEnabled = false;
  bool isSendForApprovalEnabled = false;
  bool isCancelEnabled = false;

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller_name.text = widget.itemname.name;
    _controller_description.text = widget.itemname.description;
    _controller_tagnumber.text = widget.itemname.tagnumber;
    _controller_itemcode.text = widget.itemname.itemcode;
    _controller_itemprice.text = widget.itemname.price.toString();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  title: Text(
                    'Are You Sure ?',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  content: Text(
                    'If you proceed, All the data on this page will be lost.',
                    style: TextStyle(fontSize: 17),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.purple,
                              fontWeight: FontWeight.w500),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text(
                          'Ok',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.purple,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                ));
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.purple,
          //   title: Text(
          //     'Tag Content Management',
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   actions: [
          //     Row(
          //       children: [
          //         IconButton(
          //             onPressed: () {},
          //             icon: Icon(
          //               Icons.notifications,
          //               color: Colors.white,
          //             )),
          //         IconButton(
          //           onPressed: () {},
          //           icon: Icon(
          //             Icons.settings,
          //             color: Colors.white,
          //           ),
          //         ),
          //         IconButton(
          //             onPressed: () {},
          //             icon: Icon(
          //               Icons.question_mark,
          //               color: Colors.white,
          //             ))
          //       ],
          //     )
          //   ],
          // ),
          appBar: AppbarWidget(),
          drawer: DrawerWidget(),
          body: Consumer<boolProvider>(
            builder: (context, boolProviderModel, child) =>
                SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3))
                ]),
                // height: MediaQuery.of(context).size.height * 1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Tag management/tag configuration",
                        style: TextStyle(fontSize: 15),
                      ),

                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height *
                              0.3, // Adjust the percentage as needed
                          child: Image(
                            image: AssetImage(
                                'assets/images/tagcontentmanagement/${widget.itemname.image}.jpg'),
                            fit: BoxFit.contain,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Item name",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              TextFormField(
                                controller: _controller_name,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Product description",
                              style: TextStyle(fontSize: 20),
                            ),
                            TextFormField(
                              controller: _controller_description,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8.0),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Tag number",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    TextFormField(
                                      controller: _controller_tagnumber,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(8.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ]),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Item code",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    TextFormField(
                                      controller: _controller_itemcode,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(8.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Item price",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  TextFormField(
                                    controller: _controller_itemprice,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(8.0),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ]),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Zone",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  DropdownButtonFormField<String>(
                                    value: selectedValue,
                                    items: const [
                                      DropdownMenuItem(
                                        child: Text('Zone 1'),
                                        value: 'option1',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Zone 2'),
                                        value: 'option2',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('zone 3'),
                                        value: 'option3',
                                      ),
                                      DropdownMenuItem(
                                          child: Text('Zone 4'),
                                          value: 'option4'),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value!;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(8.0),
                                        labelText: 'select an option',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Area",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  DropdownButtonFormField<String>(
                                    value: selectedValue1,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text('All'),
                                        value: 'option 1',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Area 1'),
                                        value: 'option 2',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Area 2'),
                                        value: 'option 3',
                                      ),
                                      DropdownMenuItem(
                                          child: Text(' Area 3'),
                                          value: 'option 4'),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue1 = value!;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(8.0),
                                        labelText: 'select an option',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ]),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Store Number",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(8.0),
                                        hintText: 'Enter Store number',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Select Start and End Date",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8.0),
                                  labelText: 'Start date',
                                  suffixIcon:
                                      Icon(Icons.calendar_today_rounded),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              readOnly: true,
                              onTap: () => _selectStartDate(context),
                              controller: TextEditingController(
                                text: ' ${_startDate.toString().split(' ')[0]}',
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8.0),
                                  labelText: 'End date',
                                  suffixIcon:
                                      Icon(Icons.calendar_today_rounded),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              readOnly: true,
                              onTap: () => _selectEndDate(context),
                              controller: TextEditingController(
                                text: '${_endDate.toString().split(' ')[0]}',
                              ),
                            ),
                          ),
                        ],
                      ),

                      //DateRangePickerRow(),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Marketing Message",
                              style: TextStyle(fontSize: 20),
                            ),
                            TextFormField(
                              controller: _controller_marketing_message,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8.0),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 180,
                            height: 40,
                            child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Center(
                                          child: Container(
                                            width: 900,
                                            height: 700,
                                            child: AlertDialog(
                                              content:
                                                  Text("Saved Sucessfully!!"),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        isPublishEnabled = true;
                                                        isSendForApprovalEnabled =
                                                            true;
                                                        isCancelEnabled = true;
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text(
                                                      "OK",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple),
                                child: const Text(
                                  "Save",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )),
                          ),
                          SizedBox(
                              width: 180,
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: isSendForApprovalEnabled
                                      ? () {
                                          CommingsoonSnackbarWidget.show(
                                              context);
                                        }
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.purple),
                                  child: const Text(
                                    "Send For Approval",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 180,
                            height: 40,
                            child: ElevatedButton(
                                onPressed: isPublishEnabled
                                    ? () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Center(
                                                child: Container(
                                                  width: 900,
                                                  height: 700,
                                                  child: AlertDialog(
                                                    content: const Text(
                                                        "Tag Updated and Published"),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            boolProviderModel
                                                                .setAllTrue(
                                                                    widget
                                                                        .itemname
                                                                        .id);

                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            TagContentManagement()));
                                                          },
                                                          child: const Text(
                                                            "OK",
                                                            style: TextStyle(
                                                                fontSize: 20),
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple),
                                child: const Text(
                                  "Publish",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )),
                          ),
                          SizedBox(
                            width: 180,
                            height: 40,
                            child: ElevatedButton(
                                onPressed: isCancelEnabled
                                    ? () {
                                        CommingsoonSnackbarWidget.show(context);
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
