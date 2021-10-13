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
}