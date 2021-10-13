import 'PCPart.dart';

class GPU_Part extends Part {
  double base_clock;
  double boost_clock;
  String vram;


  GPU_Part() : super() {
    this.price = 600.0;

    this.base_clock = 0;
    this.boost_clock = 0;
    this.vram = null;
  }

  GPU_Part.loadData(String partName, String manufacturerName, double price,String productURL, String productImageURL, baseclock, boostclock, vram)
      : super.loadData(partName, manufacturerName, price, productURL, productImageURL) {
    this.base_clock = baseclock;
    this.boost_clock = boostclock;
    this.vram = vram;
  }
}