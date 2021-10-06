import 'PCPart.dart';

class Storage_Part extends Part {
  String capacity;
  String storageType;
  String formFactor;

  Storage_Part() :super() {
    this.capacity = null;
    this.storageType = null;
    this.formFactor = null;
  }

  Storage_Part.loadData(String partName, String manufacturerName, double price, String capacity, String storageType, String formFactor) : super.loadData(partName, manufacturerName, price) {
    this.capacity = capacity;
    this.storageType = storageType;
    this.formFactor = formFactor;
  }
}