abstract class Part {
  String partName;
  String manufacturerName;
  double price;
  String productImageURL;

  Part() {
    this.partName = 'NOTHING HERE';
    this.manufacturerName = 'NOTHING HERE';
    this.price = 0;
    this.productImageURL = 'https://scontent-lax3-1.xx.fbcdn.net/v/t1.18169-9/18839239_1881123202136889_723974130951416267_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=d1j8zOqcHZ4AX8uidv0&_nc_ht=scontent-lax3-1.xx&oh=2243ff4f4f62d2b1799975a85b2a1139&oe=61825B70';
  }

  // non-default constructors are defined by classname.<nameofconstructor>, weird as shit
  Part.loadData(String partName, String manufacturerName, double price, String productImageURL) {
    this.partName = partName;
    this.manufacturerName = manufacturerName;
    this.price = price;
    this.productImageURL = productImageURL;
  }



}