// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:math' as math;
import 'package:b2e/model/zone_list_revenue_model.dart';
import 'package:b2e/reusable_widgets/app_bar_widget/appbar.dart';
import 'package:b2e/reusable_widgets/drawer_widget/drawer_widget.dart';
import 'package:b2e/services/data_fetching.dart';
import 'package:b2e/tag_analytics/map.dart';
import 'package:b2e/tag_analytics/provider/provider_tag_analytics.dart';
import 'package:b2e/tag_analytics/widget/expansion_tile_widget.dart';
import 'package:b2e/tag_analytics/widget/tag_analytics_legend.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TagAnalytic extends StatefulWidget {
  const TagAnalytic({super.key});

  @override
  State<TagAnalytic> createState() => _TagAnalyticState();
}

class _TagAnalyticState extends State<TagAnalytic> {
  String selectedValue1 = "";
  List<Color> colors = [];
  List<int> totalValues = [];
  late Future<void> asynchronous;
  List<double> areaValues = List.filled(5, 0);
  bool _customIcon = false;
 
  int indexOfTile = 0;
  int noOfCheckboxPerExpansionTile = 3;
  late List<bool> checkboxStates =
      List<bool>.filled(noOfCheckboxPerExpansionTile, false);
  List<ZoneListRevenueModel> zones = [];
  List<AreaModel> areas = [];
  var selectedIndex = -1;

 

  @override
  void initState() {
    super.initState();

    asynchronous = Provider.of<TagAnalyticProvider>(context,listen: false).fetchZone();

  }

  Future<void> fetchZone() async {
    
    zones = await ApiService.fetchZonelistRevenueData();
  
  }

  Color getRandomColor() {
    if (colors.length >= 5) {
      colors = [];
    }
    Color RandomColor;
    RandomColor =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    colors.add(RandomColor);
    return RandomColor;
  }

  void addingZoneValues(int count) {
    areaValues = List.filled(5, 0);
    print(">>>>>>>>>>>>>>>>>Function Called>>>>>>>>>>>>>>>>>");
    for (int i = 0; zones[count].areas.length > i; i++) {
      for (int j = 0; zones[count].areas[i].percentages.length > j; j++) {
        areaValues[j] = areaValues[j] + zones[count].areas[i].percentages[j];
        print(areaValues[j]);
      }
    }
  }

  void removingAreaValue(int count) {
    for (int i = 0;
        zones[indexOfTile].areas[count].percentages.length >= i;
        i++) {
      areaValues[i] =
          areaValues[i] - zones[indexOfTile].areas[count].percentages[i];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(),
        drawer: DrawerWidget(),
        body: Center(
            child: Consumer<TagAnalyticProvider>(
              builder:(context,TagAnalyticProviderModel,child)=> FutureBuilder(
                  future: asynchronous,
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Select area to view Tag Analytics",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 5),
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade400,
                                        offset: Offset(0, 4),
                                        blurRadius: 5,
                                        spreadRadius: 2)
                                  ]),
                              child: Column(
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: TagAnalyticProviderModel.zones.length,
                                    itemBuilder: (context, index) {
                                      var zone = TagAnalyticProviderModel.zones[index];
                                      var zoneName = zone.zoneName;
                                      areas = zone.areas;
                                      int count=index;
              
                                      var title = zoneName;
                                      
                                      print(index);
                                      
                                      return ExpansiontileWidget(
                                          changexp: (ind, expanded) {
                                            if (selectedIndex == ind) {
                                              selectedIndex = -1;
                                            } else {
                                              selectedIndex = ind;
                                            }
              
                                            setState(() {
                                             
                                              print(">>>>>>Called>>>>>>>>>>");
                                              print(TagAnalyticProviderModel.expansionChanged);
                                              print(count);
                                             TagAnalyticProviderModel. addingZoneValues(count);
                                              TagAnalyticProviderModel.expansionChanged = expanded;
                                            });
                                          },
                                          title: title,
                                          indexVal: index,
                                          selectedIndex: selectedIndex,
                                          areas: areas);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            if (TagAnalyticProviderModel.expansionChanged == true)
                              SizedBox(
                                width: double.infinity,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height * 0.5,
                                        child: PieChart(
                                          PieChartData(
                                            sections: List.generate(
                                                TagAnalyticProviderModel.areaValues.length,
                                                (index) => PieChartSectionData(
                                                    color: TagAnalyticProviderModel.Totalcolors[index],
                                                    value:
                                                       TagAnalyticProviderModel.areaValues[index].toDouble(),
                                                    // title: zone[0]
                                                    //     .areas[2].values[index],
                                                    radius: 70)),
                                            sectionsSpace: 2,
                                            centerSpaceRadius: 100,
                                            centerSpaceColor: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: List.generate(
                                             TagAnalyticProviderModel.zones[0].areas[2].values.length,
                                              (index) => Legend(
                                                  color: TagAnalyticProviderModel.Totalcolors[index],
                                                  label:TagAnalyticProviderModel.zones[0]
                                                      .areas[2]
                                                      .values[index])),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            if (TagAnalyticProviderModel.expansionChanged == false)
                              // Container(
                              //   height: 310,
                              //   decoration: BoxDecoration(
                              //       // color: Colors.red,
                              //       image: DecorationImage(
                              //     image: AssetImage("assets/images/zonelist.jpg"),
                              //     fit: BoxFit.fitHeight,
                              //   )),
                              // ),
              
                            //TagAnalyticsZoneListPage(),
                            map()
                          ],
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  })),
            )));
  }
}

