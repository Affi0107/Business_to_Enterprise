import 'package:flutter/material.dart';


// Create a class to hold the boolean variables
class boolProvider extends ChangeNotifier {
 List<bool> publishBoolean=[false,false,false,false,false,false,false,false];

  // Function to set all booleans to true
  void setAllTrue( int index) {
     publishBoolean[index-1]=true;
     print(">>>>>>>>>>>>>>>>>>>>>>Hi");
    notifyListeners();
  }
}