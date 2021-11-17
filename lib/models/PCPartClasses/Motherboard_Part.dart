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
      json['price'] == null ? 0.0 : json['price'].toDouble(), // forcefully convert int to double,
      json['productURL'] as String,
      json['productImageURL'] as String,
    );
  }

  factory Motherboard_Part.fromJson2(dynamic json) {

    return Motherboard_Part.loadData(
      json['name'] as String,
      json['manufacturer'] as String,
        json['price'] == null ? 0.0 : json['price'].toDouble(), // forcefully convert int to double,
      json['productURL'] as String ?? "",
      json['images'][0],
      json['chipset'],
      json['socket'],
      json['form']
    );
  }

}