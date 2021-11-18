import 'Part.dart';

class Cooler_Part extends Part {
  String coolingType;
  String fanSpeed;

  Cooler_Part() : super() {
    this.coolingType = null;
    this.fanSpeed = null;
  }

  Cooler_Part.loadFromDatabase(String partName, String manufacturerName, double price, String productURL, String productImageURL) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL);

  Cooler_Part.loadData(String partName, String manufacturerName, double price,String productURL, String productImageURL, String coolerType, String fanSpeed) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL) {
    this.coolingType = coolerType;
    this.fanSpeed = fanSpeed;
  }

  Cooler_Part.demoConstructor(String partName, String manufacturerName, double price, String productURL, String productImageURL) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL);

  factory Cooler_Part.fromJson(dynamic json) {
    return Cooler_Part.loadFromDatabase(
        json['partName'] as String,
        json['manufacturerName'] as String,
        json['price'] as double,
        json['productImageURL'] as String,
        json['productURL'] as String
    );
  }
  factory Cooler_Part.fromJson2(dynamic json) {

    double price = getLowestPrice(json['stores']);

    return Cooler_Part.loadData(
      json['name'] as String,
      json['manufacturer'] as String,
        price,
      json['productURL'] as String ?? "",
      json['images'][0],
      json['water'],
      json['rpm']
    );
  }
}