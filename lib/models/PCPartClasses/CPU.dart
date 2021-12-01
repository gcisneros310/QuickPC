import 'Part.dart';

class CPU_Part extends Part{
  double base_clock;
  double boost_clock;
  int coreCount;

  var attributeNames = [
    "Manufacturer",
  "Base Clock",
  "Boost Clock",
  "Core Count"
  ];

  CPU_Part.loadFromDatabase(String partName, String manufacturerName, double price, String productURL, String productImageURL) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL);

  CPU_Part() : super() {
    this.price = 0;
    this.base_clock = 0;
    this.boost_clock = 0;
    this.coreCount = 0;
    this.partName = "NO CPU CHOSEN";
    this.setPartAttributeMapData();
  }

  CPU_Part.valueConstructors(String partName, String manufacturerName, double price, String productURL, String productImageURL, double baseclk, double boostclk, int coreCount) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL){
    this.base_clock = baseclk;
    this.boost_clock = boostclk;
    this.coreCount = coreCount;
    this.setPartAttributeMapData();
  }

  CPU_Part.demoConstructor(String partName, String manufacturerName, double price, String productURL, String productImageURL) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL);

  CPU_Part.loadData(String partName, String manufacturerName, double price, String productURL, String productImageURL, double baseclk, double boostclk, int coreCount) :
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

  void setPartAttributeMapData() {
    this.partAttributeMap = {
      'Manufacturer': this.manufacturerName,
      'Base Clock': this.base_clock,
      'Boost Clock': this.boost_clock,
      'Cores': this.coreCount,
    };
  }


  factory CPU_Part.fromJson(Map<dynamic, dynamic> json) {
    return CPU_Part.loadFromDatabase(
      json['partName'] as String,
      json['manufacturerName'] as String,
      json['price'] as double,
      json['productImageURL'] as String,
      json['productURL'] as String
    );
  }

  factory CPU_Part.fromJson2(dynamic json) {

    double price = getLowestPrice(json['stores']);

    int cores = int.parse(json['cores']);
    double base = double.parse(json['core clock'].replaceAll(RegExp(" GHz"), ""));
    double boost = double.parse(json['boost clock'].replaceAll(RegExp(" GHz"), ""));

    return CPU_Part.loadData(
      json['name'] as String,
      json['manufacturer'] as String,
      price,
      json['productURL'] as String ?? "",
      json['images'][0],
      base,
      boost,
      cores
    );
  }
}