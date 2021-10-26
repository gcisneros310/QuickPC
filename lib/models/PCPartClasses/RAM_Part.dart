import 'PCPart.dart';

class RAM_Part extends Part {
  String clockSpeed;
  String timings;
  String memoryCapacity;
  int stickCount;

  RAM_Part() : super() {
    this.price = 0.0;
    this.clockSpeed = null;
    this.timings = null;
    this.memoryCapacity = null;
    this.stickCount = 0;
  }
  
  RAM_Part.loadData(String partName, String manufacturerName, double price,String productURL, String productImageURL, String clockSpeed, String timings, String memoryCapacity, int stickCount) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL){
    this.clockSpeed = clockSpeed;
    this.timings = timings;
    this.memoryCapacity = memoryCapacity;
    this.stickCount = stickCount;
  }

  RAM_Part.demoConstructor(String partName, String manufacturerName, double price, String productURL, String productImageURL) :
        super.loadData(partName, manufacturerName, price, productURL, productImageURL);
}