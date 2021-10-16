import 'PCPart.dart';

class CPU_Part extends Part{
  double base_clock;
  double boost_clock;
  int coreCount;

  CPU_Part() : super() {
    this.price = 200.0;
    this.base_clock = 0;
    this.boost_clock = 0;
    this.coreCount = 0;
  }

  CPU_Part.valueConstructors(String partName, String manufacturerName, double price, String productURL, String productImageURL, double baseclk, double boostclk, int coreCount) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL){
    this.base_clock = baseclk;
    this.boost_clock = boostclk;
    this.coreCount = coreCount;
  }

  fromDatabase(Map<dynamic, dynamic> data){

    return CPU_Part.valueConstructors(
        data['name'] ?? "CPU",
        data['manufacturer'] ?? "Manufactuer",
        double.parse(data['price']) ?? 0.0,
        data['newegg_URL'],
        data['image_URL'],
        double.parse(data['base clock']) ?? 0.0,
        double.parse(data['boost clock']) ?? 0.0,
        int.parse(data['core count']) ?? 0
    );

  }


}