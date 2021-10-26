import 'PCPart.dart';

class Cooler_Part extends Part {
  String coolingType;
  int fanSpeed;

  Cooler_Part() : super() {
    this.coolingType = null;
    this.fanSpeed = 0;
  }

  Cooler_Part.loadData(String partName, String manufacturerName, double price,String productURL, String productImageURL, String coolerType, int fanSpeed) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL) {
    this.coolingType = coolerType;
    this.fanSpeed = fanSpeed;
  }

  Cooler_Part.demoConstructor(String partName, String manufacturerName, double price, String productURL, String productImageURL) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL);
}