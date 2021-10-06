import 'PCPart.dart';

class PSU_Part extends Part {
  int wattage;
  String efficiencyRating;
  String modularityType;

  PSU_Part () : super() {
    this.wattage = 0;
    this.efficiencyRating = null;
    this.modularityType = null;
  }

  PSU_Part.loadData(String partName, String manufacturerName, double price, int wattage, String modularityType, String formFactor) : super.loadData(partName, manufacturerName, price) {
    this.wattage = wattage;
    this.efficiencyRating = efficiencyRating;
    this.modularityType = modularityType;
  }
}