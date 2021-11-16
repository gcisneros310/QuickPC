import 'Part.dart';

class Storage_Part extends Part {
  String capacity;
  String storageType;
  String formFactor;

  Storage_Part() : super() {
    this.price = 0.0;

    this.capacity = null;
    this.storageType = null;
    this.formFactor = null;
  }

  Storage_Part.loadFromDatabase(String partName, String manufacturerName, double price, String productURL, String productImageURL) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL);

  Storage_Part.loadData(String partName, String manufacturerName, double price,String productURL, String productImageURL, String capacity, String storageType, String formFactor)
      : super.loadData(partName, manufacturerName, price, productURL, productImageURL){
    this.capacity = capacity;
    this.storageType = storageType;
    this.formFactor = formFactor;
  }

  Storage_Part.demoConstructor(String partName, String manufacturerName, double price, String productURL, String productImageURL) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL);

  factory Storage_Part.fromJson(dynamic json) {
    return Storage_Part.loadFromDatabase(
        json['partName'] as String,
        json['manufacturerName'] as String,
        json['price'] as double,
        json['productImageURL'] as String,
        json['productURL'] as String
    );
  }

  factory Storage_Part.fromJson2(dynamic json) {
    return Storage_Part.loadData(
        json['name'] as String,
        json['manufacturer'] as String,
        json['price'] as double ?? 0.0,
        json['productURL'] as String ?? "",
        json['images'][0],
        json['capacity'],
        json['type'],
        json['form']
    );
  }
}