import 'Part.dart';

class GPU_Part extends Part {
  String base_clock;
  String boost_clock;
  String vram;


  GPU_Part() : super() {
    this.price = 0.0;

    this.base_clock = '0';
    this.boost_clock = '0';
    this.vram = null;
  }

  GPU_Part.loadFromDatabase(String partName, String manufacturerName, double price, String productURL, String productImageURL) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL);

  GPU_Part.loadData(String partName, String manufacturerName, double price,String productURL, String productImageURL, baseclock, boostclock, vram, int tdp)
      : super.loadData(partName, manufacturerName, price, productURL, productImageURL) {
    this.base_clock = baseclock;
    this.boost_clock = boostclock;
    this.vram = vram;
    this.tdp = tdp;
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
        data['vram'],
        data['tdp'] ?? 0
    );
  }

  GPU_Part.demoConstructor(String partName, String manufacturerName, double price, String productURL, String productImageURL) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL);

  factory GPU_Part.fromJson(dynamic json) {
    return GPU_Part.loadFromDatabase(
      json['partName'] as String,
      json['manufacturerName'] as String,
      json['price'] == null ? 0.0 : json['price'].toDouble(), // forcefully convert int to double,
      json['productURL'] as String,
      json['productImageURL'] as String,
    );
  }

  factory GPU_Part.fromJson2(dynamic json) {
    double price = getLowestPrice(json['stores']);
    String image;
    if (json['images'] == null)
      image = "";
    else
      image = json['images'][0];


    return GPU_Part.loadData(
      json['name'] as String,
      json['manufacturer'] as String,
      price,
      json['productURL'] as String ?? "",
      image,
      json['base clock'],
      json['boost clock'],
      json['memory'],
      int.parse(json['tdp'].replaceAll(RegExp(" W"), "")) ?? 0,
    );
  }
}