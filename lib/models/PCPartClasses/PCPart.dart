abstract class Part {
  String partName;
  String manufacturerName;
  double price;
  String productURL;
  String productImageURL;
  bool partIsChosen;

  Part() {
    this.partName = 'No part chosen';
    this.manufacturerName = 'empty';
    this.price = 0;
    this.productURL = 'www.google.com';
    this.productImageURL = 'https://static.wikia.nocookie.net/roblox-phantom-forces/images/a/a9/Photo-here.png/revision/latest?cb=20180710181254';
    this.partIsChosen = false;
  }

  // non-default constructors are defined by classname.<nameofconstructor>, weird as shit
  Part.loadData(String partName, String manufacturerName, double price, String productURL, String productImageURL) {
    this.partIsChosen = true;
    this.productURL = productURL;
    this.partName = partName;
    this.manufacturerName = manufacturerName;
    this.price = price;
    this.productImageURL = productImageURL;
  }




}