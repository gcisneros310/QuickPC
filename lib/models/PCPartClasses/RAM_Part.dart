import 'PCPart.dart';

class RAM_Part extends Part {
  String clockSpeed;
  String timings;
  String memoryCapacity;
  int stickCount;

  RAM_Part() : super() {
    this.clockSpeed = null;
    this.timings = null;
    this.memoryCapacity = null;
    this.stickCount = 0;
  }
  
  RAM_Part.loadData(String partName, String manufacturerName, double price, String clockSpeed, String timings, String memoryCapacity, int stickCount) : super.loadData(partName, manufacturerName, price){
    this.clockSpeed = clockSpeed;
    this.timings = timings;
    this.memoryCapacity = memoryCapacity;
    this.stickCount = stickCount;
  }
}