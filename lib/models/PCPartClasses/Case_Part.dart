import 'PCPart.dart';

class Case_Part extends Part {
  String motherboardFormFactor;
  String color;
  String dimensions;

  Case_Part() : super() {
    this.motherboardFormFactor = null;
    this.color = null;
    this.dimensions = null;
  }

  Case_Part.loadData(String partName, String manufacturerName, double price, String productURL, String productImageURL, String motherboardFormFactor, String color, String dimensions)
      : super.loadData(partName, manufacturerName, price, productURL, productImageURL) {
    this.motherboardFormFactor = motherboardFormFactor;
    this.color = color;
    this.dimensions = dimensions;
  }

  Case_Part.demoConstructor(String partName, String manufacturerName, double price, String productURL, String productImageURL) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL);
}