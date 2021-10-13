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

  GPU_Part.loadData(String partName, String manufacturerName, double price, String productImageURL,
      baseclock, boostclock, vram)
      : super.loadData(partName, manufacturerName, price, productImageURL) {
    this.base_clock = baseclock;
    this.boost_clock = boostclock;
    this.vram = vram;
  }


  fromDatabase(Map<dynamic, dynamic> data){
    return GPU_Part.loadData(
        data['name'],
        data['manufacturer'],
        data['price'],
        data['image_URL'],
        data['baseClock'],
        data['boostClock'],
        data['vram']);
  }

}