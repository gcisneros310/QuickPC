abstract class Part {
  String partName;
  String manufacturerName;
  double price;

  Part() {
    this.partName = 'Choose a part';
    this.manufacturerName = null;
    this.price = 0;
  }

  // non-default constructors are defined by classname.<nameofconstructor>, weird as shit
  Part.loadData(String partName, String manufacturerName, double price){
    this.partName = partName;
    this.manufacturerName = manufacturerName;
    this.price = price;
  }



}