class AreaModel {
  final String areaName;
  final List<int> prices;
  final List<int> percentages;
  final List<String> values;

  AreaModel({
    required this.areaName,
    required this.prices,
    required this.percentages,
    required this.values,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    List<int> prices = List<int>.from(json['prices']);
    List<int> percentages = List<int>.from(json['percentages']);
    List<String> values = List<String>.from(json['values']);

    return AreaModel(
      areaName: json['area_name'],
      prices: prices,
      percentages: percentages,
      values: values,
    );
  }
}

class ZoneListRevenueModel {
  final String zoneName;
  final List<AreaModel> areas;

  ZoneListRevenueModel({
    required this.zoneName,
    required this.areas,
  });

  factory ZoneListRevenueModel.fromJson(Map<String, dynamic> json) {
    List<AreaModel> areas = [];
    var areaList = json['areas'] as List;
    for (var areaJson in areaList) {
      var area = AreaModel.fromJson(areaJson);
      areas.add(area);
      
    }
    print(areas[0].prices);

    return ZoneListRevenueModel(
      zoneName: json['zone_name'],
      areas: areas,
    );
  }
}
