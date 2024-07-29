import 'package:b2e/model/zone_list_revenue_model.dart';
import 'package:b2e/services/data_fetching.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TagAnalyticProvider extends ChangeNotifier {
  List<ZoneListRevenueModel> zones = [];
  List<double> areaValues = List.filled(5, 0);
  List<bool> areaBoolValues = List.filled(3, false);
  int boolCount=0;


   bool expansionChanged = false;

   List<Color> Totalcolors=[Colors.grey,Colors.red,Colors.purple,Colors.deepOrange,Colors.green];

  Future<void> fetchZone() async {
    zones = await ApiService.fetchZonelistRevenueData();
    ChangeNotifier();
  }

  void addingZoneValues(int count) {
    areaValues = List.filled(5, 0);
    areaBoolValues = List.filled(3, false);
    boolCount=0;
    print(">>>>>>>>>>>>>>>>>Function Called>>>>>>>>>>>>>>>>>");
    for (int i = 0; zones[count].areas.length > i; i++) {
      for (int j = 0; zones[count].areas[i].percentages.length > j; j++) {
        areaValues[j] = areaValues[j] + zones[count].areas[i].percentages[j];
        print(areaValues[j]);
      }
    }
    ChangeNotifier();
  }

  void removingAreaValue(int indexOfTile,int count) {
    print(indexOfTile);

    print(count);
    for(int i=0;areaValues.length>i;i++){
      areaValues[i]=areaValues[i]-zones[indexOfTile].areas[count].percentages[i];
      print(areaValues[i]);
    }
    
    boolCount=boolCount+1;
    if(boolCount==3){
      expansionChanged=false;
    }
    notifyListeners();
  }


  void addingAreaValue(int indexOfTile,int count) {
    print(indexOfTile);

    print(count);
    for(int i=0;areaValues.length>i;i++){
      areaValues[i]=areaValues[i]+zones[indexOfTile].areas[count].percentages[i];
      print(areaValues[i]);
    }
    boolCount=boolCount-1;
    expansionChanged=true;
    notifyListeners();
  }
  
}
