// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:b2e/tag_analytics/provider/provider_tag_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/zone_list_revenue_model.dart';

class ExpansiontileWidget extends StatefulWidget {
  const ExpansiontileWidget({
    super.key,
    required this.changexp,
    required this.title,
    required this.indexVal,
    required this.selectedIndex,
    required this.areas,
  });
  final Function changexp;
  final indexVal;
  final String title;
  final selectedIndex;
  final List<AreaModel> areas;

  @override
  State<ExpansiontileWidget> createState() => _ExpansiontileState();
}

class _ExpansiontileState extends State<ExpansiontileWidget> {
  bool _customIcon = false;
  late int noOfCheckboxPerExpansionTile;
  late List<bool> checkboxStates;

  @override
  void initState() {
    super.initState();
    noOfCheckboxPerExpansionTile = widget.areas.length;
    checkboxStates = List<bool>.filled(noOfCheckboxPerExpansionTile, false);
  }

  //  =AboutListTile List<bool>.filled(noOfCheckboxPerExpansionTile, false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Consumer<TagAnalyticProvider>(
        builder:(context,TagAnalyticProviderModel,child)=>ExpansionTile(
          key: GlobalKey(),
          initiallyExpanded: widget.selectedIndex == widget.indexVal,
          collapsedBackgroundColor: Colors.grey.shade300,
          backgroundColor: Colors.purple,
          shape:
              ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40)),
          collapsedShape:
              ContinuousRectangleBorder(borderRadius: BorderRadius.circular(25)),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Text(
              widget.title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: widget.selectedIndex == widget.indexVal
                      ? Colors.white
                      : Colors.purple.shade600),
            ),
          ),
          leading: Icon(
            widget.selectedIndex == widget.indexVal
                ? Icons.add_circle
                : Icons.add_circle_outline,
            color: widget.selectedIndex == widget.indexVal
                ? Colors.white
                : Colors.purple.shade600,
            size: 25,
          ),
          onExpansionChanged: (bool expanded) {
            widget.changexp(widget.indexVal, expanded);
            setState(() {
              _customIcon = expanded;
              if (expanded) {
                checkboxStates =
                    List<bool>.filled(noOfCheckboxPerExpansionTile, true);
              } else {
                checkboxStates =
                    List<bool>.filled(noOfCheckboxPerExpansionTile, false);
              }
              // print(expansionChanged);
            });
          },
          trailing: Text(
            "View",
            style: TextStyle(
                fontSize: 15,
                fontWeight: widget.selectedIndex == widget.indexVal
                    ? FontWeight.w500
                    : FontWeight.bold,
                color: widget.selectedIndex == widget.indexVal
                    ? Colors.white
                    : Colors.purple),
          ),
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.areas.length,
              itemBuilder: (context, index) {
                var area = widget.areas[index];
                final areaName = area.areaName;
                // print(widget.areas.length);
                // print(area.runtimeType);
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.purple.shade300,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: CheckboxListTile(
                      dense: true,
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      side: BorderSide(color: Colors.white, width: 1.5),
                      activeColor: Colors.purple,
                      checkColor: Colors.white,
                      title: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Text(
                          areaName,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      value: checkboxStates[index],
                      onChanged: (bool? value) {
                        setState(() {
                          checkboxStates[index] = value!;
                        });
                        if(value==false){
                          TagAnalyticProviderModel.removingAreaValue(widget.indexVal,index);
                        }
                        else if(value==true){
                          TagAnalyticProviderModel.addingAreaValue(widget.indexVal,index);
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
