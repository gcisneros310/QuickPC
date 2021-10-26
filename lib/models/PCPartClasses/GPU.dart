import 'PCPart.dart';

class GPU_Part extends Part {
  String base_clock;
  String boost_clock;
  String vram;


  GPU_Part() : super() {
    this.price = 600.0;

    this.base_clock = '0';
    this.boost_clock = '0';
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
        data['price'] ?? 0.0,
        data['newegg_URL'],
        data['image_URL'],
        data['base clock'],
        data['boost clock'],
        data['vram']);
  }

}