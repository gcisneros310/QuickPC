import 'PCPart.dart';

class Cooler_Part extends Part {
  String coolingType;
  int fanSpeed;

  Cooler_Part() : super() {
    this.coolingType = null;
    this.fanSpeed = 0;
  }

  Cooler_Part.loadData(String partName, String manufacturerName, double price, String coolerType, int fanSpeed) : super.loadData(partName, manufacturerName, price) {
    this.coolingType = coolerType;
    this.fanSpeed = fanSpeed;
  }
}