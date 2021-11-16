import 'Part.dart';

class PSU_Part extends Part {
  int wattage;
  String efficiencyRating;
  String modularityType;

  PSU_Part () : super() {
    this.price = 0.0;

    this.wattage = 0;
    this.efficiencyRating = null;
    this.modularityType = null;
  }

  PSU_Part.loadFromDatabase(String partName, String manufacturerName, double price, String productURL, String productImageURL) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL);

  PSU_Part.loadData(String partName, String manufacturerName, double price,String productURL, String productImageURL, int wattage, String modularityType, String efficiencyRating) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL){
    this.wattage = wattage;
    this.modularityType = modularityType;
    this.efficiencyRating = efficiencyRating;
  }

  PSU_Part.demoConstructor(String partName, String manufacturerName, double price, String productURL, String productImageURL) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL);

  factory PSU_Part.fromJson(dynamic json) {
    return PSU_Part.loadFromDatabase(
        json['partName'] as String,
        json['manufacturerName'] as String,
        json['price'] as double,
        json['productImageURL'] as String,
        json['productURL'] as String
    );
  }

  factory PSU_Part.fromJson2(dynamic json) {

    int wat = int.parse(json['wattage'].replaceAll(RegExp(" W"), ""));

    return PSU_Part.loadData(
      json['name'] as String,
      json['manufacturer'] as String,
      json['price'] as double ?? 0.0,
      json['productURL'] as String ?? "",
      json['images'][0],
      wat,
      json['modular'],
      json['rating']
    );
  }
}