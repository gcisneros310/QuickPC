import 'Part.dart';

class RAM_Part extends Part {
  String clockSpeed;
  String timings;
  String memoryCapacity;
  int stickCount;
  dynamic info;

  RAM_Part() : super() {
    this.price = 0.0;
    this.clockSpeed = null;
    this.timings = null;
    this.memoryCapacity = null;
    this.stickCount = 0;
  }

  RAM_Part.loadFromDatabase(String partName, String manufacturerName, double price, String productURL, String productImageURL) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL);
  
  RAM_Part.loadData(String partName, String manufacturerName, double price,String productURL, String productImageURL, String clockSpeed, String timings, String memoryCapacity, int stickCount) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL){
    this.clockSpeed = clockSpeed;
    this.timings = timings;
    this.memoryCapacity = memoryCapacity;
    this.stickCount = stickCount;
  }

  RAM_Part.demoConstructor(String partName, String manufacturerName, double price, String productURL, String productImageURL) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL);

  factory RAM_Part.fromJson(dynamic json) {
    return RAM_Part.loadFromDatabase(
      json['partName'] as String,
      json['manufacturerName'] as String,
      json['price'] == null ? 0.0 : json['price'].toDouble(), // forcefully convert int to double,
      json['productURL'] as String,
      json['productImageURL'] as String,
    );
  }

  factory RAM_Part.fromJson2(dynamic json) {
    double price = getLowestPrice(json['stores']);

    var count = int.parse(json['module'].substring(0,1));
    var cap = json['module'].substring(4);


    return RAM_Part.loadData(
        json['name'] as String,
        json['manufacturer'] as String,
        price, // forcefully convert int to double,
        json['productURL'] as String ?? "",
        json['images'][0],
        json['speed'],
        json['timing'],
        cap,
        count
    );
  }

  String getModule(){
    return stickCount.toString() + " x " + memoryCapacity;
  }


  loadInfo(dynamic json)  {
    loadMap(json);
    info = json;
  }

}