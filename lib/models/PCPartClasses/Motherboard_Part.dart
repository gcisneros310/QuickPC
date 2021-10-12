import 'PCPart.dart';

class Motherboard_Part extends Part {
  String chipset;
  String cpuSocket;
  String formFactor;

  Motherboard_Part() : super() {
    this.price = 139.0;
    this.chipset = null;
    this.cpuSocket = null;
    this.formFactor = null;
  }

  Motherboard_Part.loadData(String partName, String manufacturerName, double price, String productImageURL, String chipset, String socket, String formFactor) :
        super.loadData(partName, manufacturerName, price, productImageURL){
    this.chipset = chipset;
    this.cpuSocket = socket;
    this.formFactor = formFactor;
  }
}