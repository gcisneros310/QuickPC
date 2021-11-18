import 'Part.dart';

class Motherboard_Part extends Part {
  String chipset;
  String cpuSocket;
  String formFactor;


  Motherboard_Part() : super() {
    this.price = 0.0;
    this.chipset = null;
    this.cpuSocket = null;
    this.formFactor = null;
  }

  Motherboard_Part.loadFromDatabase(String partName, String manufacturerName, double price, String productURL, String productImageURL) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL);

  Motherboard_Part.loadData(String partName, String manufacturerName, double price,String productURL, String productImageURL, String chipset, String socket, String formFactor) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL){
    this.chipset = chipset;
    this.cpuSocket = socket;
    this.formFactor = formFactor;
  }

  Motherboard_Part.demoConstructor(String partName, String manufacturerName, double price, String productURL, String productImageURL) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL);

  factory Motherboard_Part.fromJson(dynamic json) {
    return Motherboard_Part.loadFromDatabase(
        json['partName'] as String,
        json['manufacturerName'] as String,
        json['price'] as double,
        json['productImageURL'] as String,
        json['productURL'] as String
    );
  }

  factory Motherboard_Part.fromJson2(dynamic json) {

    double price = getLowestPrice(json['stores']);

    return Motherboard_Part.loadData(
      json['name'] as String,
      json['manufacturer'] as String,
        price,
      json['productURL'] as String ?? "",
      json['images'][0],
      json['chipset'],
      json['socket'],
      json['form']
    );
  }

}