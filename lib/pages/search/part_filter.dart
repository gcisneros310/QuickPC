import 'package:quick_pc/models/PCPartClasses/PCPart.dart';

class Filter {
  double priceMin = 100;
  double priceMax = 300;

  String manufactuer = "EVGA";

  getFilter(){
    return Filter();
  }

  getFilteredList(List<Part> list){
    
    return list.where((part) =>
        (part.price > priceMin) &&
            (part.price < priceMax)).toList();
    
  }

}