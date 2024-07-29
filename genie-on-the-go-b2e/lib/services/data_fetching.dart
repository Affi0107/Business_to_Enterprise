import 'dart:convert';
import 'package:b2e/model/json_model.dart';
import 'package:b2e/model/model_zone_model.dart';
import 'package:flutter/services.dart';

import '../model/zone_list_revenue_model.dart';

class ApiService {
  static fetchValueData() async {
    final String data = await rootBundle.loadString('assets/json/value.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((e) => JsonModel.fromJson(e)).toList();
  }

  static fetchZonelistRevenueData() async {
    final String data =
        await rootBundle.loadString('assets/json/zone_list_revenue.json');
    final List<dynamic> jsonData = json.decode(data);
    return jsonData.map((e) => ZoneListRevenueModel.fromJson(e)).toList();
  }
}
