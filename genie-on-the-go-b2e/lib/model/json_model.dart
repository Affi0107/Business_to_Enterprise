class JsonModel {
  final int id;
  final String name;
  final String description;
  final String tagnumber;
  final String itemcode;
  final String image;
  final double price;
  final String status;
  
  

  JsonModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.tagnumber,
      required this.itemcode,
      required this.image,
      required this.price,
      required this.status,
      });

  //deserialization
  factory JsonModel.fromJson(Map<String, dynamic> json) {
    return JsonModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        tagnumber: json['tagnumber'],
        itemcode: json['itemcode'],
        image: json['image'],
        price: json['price'],
        status: json['status'],);    
  }
}
