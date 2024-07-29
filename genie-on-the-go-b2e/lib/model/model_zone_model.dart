class ZoneModel {
  final String zoneName;
  final List<String> values;
  final List<int> percentages;
  final List<int> prices;
  final List<String> areas;

  ZoneModel(
      {required this.zoneName,
      required this.values,
      required this.percentages,
      required this.prices,
      required this.areas});

  factory ZoneModel.fromJson(Map<String, dynamic> json) {
    return ZoneModel(
        zoneName: json['zoneName'],
        values: List<String>.from(json['values']),
        percentages: List<int>.from(json['percentages']),
        prices: List<int>.from(json['prices']),
        areas: List<String>.from(json['areas']));
  }
}
