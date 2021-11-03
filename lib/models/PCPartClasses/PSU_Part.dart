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

  PSU_Part.loadData(String partName, String manufacturerName, double price,String productURL, String productImageURL, int wattage, String modularityType, String formFactor) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL){
    this.wattage = wattage;
    this.efficiencyRating = efficiencyRating;
    this.modularityType = modularityType;
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
}