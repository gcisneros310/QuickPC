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
      json['price'] == null ? 0.0 : json['price'].toDouble(), // forcefully convert int to double,
      json['productURL'] as String,
      json['productImageURL'] as String,
    );
  }

  factory Storage_Part.fromJson2(dynamic json) {
    double price = getLowestPrice(json['stores']);

    return Storage_Part.loadData(
      json['name'] as String,
      json['manufacturer'] as String,
        price, // forcefully convert int to double,
      json['productURL'] as String ?? "",
      json['images'][0],
      json['capacity'],
      json['type'],
      json['form'].replaceAll(" ", "")
    );
  }

  getGB(){
    if(capacity.contains('TB')){
      print(int.parse(capacity.replaceAll(RegExp(" TB"), "")) * 1000);
      return int.parse(capacity.replaceAll(RegExp(" TB"), "")) * 1000;
    }

    print(int.parse(capacity.replaceAll(RegExp(" GB"), "")));
    return int.parse(capacity.replaceAll(RegExp(" GB"), ""));
  }

}