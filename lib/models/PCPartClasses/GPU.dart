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


  fromDatabase(Map<dynamic, dynamic> data){
    return GPU_Part.loadData(
        data['name'],
        data['manufacturer'],
        double.parse(data['price']) ?? 0.0,
        data['newegg_URL'],
        data['image_URL'],
        double.parse(data['baseClock']) ?? 0.0,
        double.parse(data['boostClock']) ?? 0.0,
        data['vram']);
  }

}