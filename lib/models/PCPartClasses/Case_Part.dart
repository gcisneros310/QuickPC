import 'Part.dart';

class Case_Part extends Part {
  String motherboardFormFactor;
  String color;
  String dimensions;

  Case_Part() : super() {
    this.motherboardFormFactor = null;
    this.color = null;
    this.dimensions = null;
  }

  Case_Part.loadFromDatabase(String partName, String manufacturerName, double price, String productURL, String productImageURL) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL);

  Case_Part.loadData(String partName, String manufacturerName, double price, String productURL, String productImageURL, String motherboardFormFactor, String color, String dimensions)
      : super.loadData(partName, manufacturerName, price, productURL, productImageURL) {
    this.motherboardFormFactor = motherboardFormFactor;
    this.color = color;
    this.dimensions = dimensions;
  }

  Case_Part.demoConstructor(String partName, String manufacturerName, double price, String productURL, String productImageURL) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL);

  factory Case_Part.fromJson(dynamic json) {
    return Case_Part.loadFromDatabase(
      json['partName'] as String,
      json['manufacturerName'] as String,
      json['price'] == null ? 0.0 : json['price'].toDouble(), // forcefully convert int to double,
      json['productURL'] as String,
      json['productImageURL'] as String,
    );
  }

  factory Case_Part.fromJson2(dynamic json) {

    double price = getLowestPrice(json['stores']);

    return Case_Part.loadData(
      json['name'] as String,
      json['manufacturer'] as String,
        price,
      json['productURL'] as String ?? "",
      json['images'][0],
      json['form'],
      json['type'],
      json['dimensions']
    );
  }
}