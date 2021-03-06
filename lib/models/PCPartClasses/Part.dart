import 'dart:io';

abstract class Part {
  String partName;
  String manufacturerName;
  double price;
  String productURL;
  String productImageURL;
  bool deviceImagePresent;
  File deviceImage;
  bool partIsChosen;
  int tdp;
  Map partAttributeMap = {};

  Part() {
    this.partName = 'No part chosen';
    this.manufacturerName = 'empty';
    this.price = 0;
    this.productURL = 'www.google.com';
    this.productImageURL = 'https://static.wikia.nocookie.net/roblox-phantom-forces/images/a/a9/Photo-here.png/revision/latest?cb=20180710181254';
    this.deviceImagePresent = false;
    this.partIsChosen = false;
    this.tdp = 0;
  }

  // non-default constructors are defined by classname.<nameofconstructor>, weird as shit
  Part.loadData(String partName, String manufacturerName, double price, String productURL, String productImageURL) {
    this.partIsChosen = true;
    this.deviceImagePresent = false;
    this.productURL = productURL;
    this.partName = partName;
    this.manufacturerName = manufacturerName;
    this.price = price;
    this.productImageURL = productImageURL;
  }

  Map toJson() {
    return {
      "partName": partName.toString(),
      "manufacturerName": manufacturerName.toString(),
      "price": price,
      "productURL": productURL.toString(),
      "productImageURL": productImageURL.toString(),
      "tdp" : tdp
    };
  }

  static fromJson(e) {}

  loadMap(dynamic json) {
    partAttributeMap = json;
  }



}

double getLowestPrice(Map<dynamic, dynamic> stores) {
  double lowestPrice = double.maxFinite;
  stores.forEach((key, value) {
    double p = double.parse(value['price'].replaceAll("\$", ""));
    if (p < lowestPrice){
      lowestPrice = p;
    }
  });

  return lowestPrice;
}