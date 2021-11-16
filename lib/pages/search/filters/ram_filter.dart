import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';
import 'package:quick_pc/models/PCPartClasses/RAM_Part.dart';

class RAMFilter{

  Map<String, dynamic> rangeFilters = {
    'Price \$' : {'min': 0.0, 'max': 12000.0, 'range': RangeValues(0.0, 12000.0)},
    'Speed': {'min':300.0, 'max': 6000.0, 'range': RangeValues(300.0, 6000.0)},
    'Cas Latency': {'min': 1.0, 'max': 40.0, 'range': RangeValues(1.0, 40.0)},
  };

  Map<String, dynamic> checkboxFilters = {

    'Manufacturers': {"AMD": false, "Intel": false},

    'Type': {"DDR": false, "DDR2": false, "DDR3": false, "DDR4": false,
      "DDR5": false},

    'Modules': {"1 x 512MB": false, "1 x 1GB": false, "2 x 512MB": false,
      "1 x 2GB": false, "2 x 1GB": false, "3 x 1GB": false, "1 x 4GB": false,
      "2 x 2GB": false, "3 x 2GB": false, "1 x 8GB": false, "2 x 4GB": false,
      "4 x 2GB": false, "3 x 4GB": false, "6 x 2GB": false, "1 x 16GB": false,
      "2 x 8GB": false, "4 x 4GB": false, "3 x 8GB": false, "6 x 4GB": false,
      "1 x 32GB": false, "2 x 16GB": false, "4 x 8GB": false, "8 x 4GB": false,
      "3 x 16GB": false, "1 x 64GB": false, "2 x 32GB": false, "4 x 16GB": false,
      "8 x 8GB": false, "3 x 32GB": false, "1 x 128GB": false, "4 x 32GB": false,
      "8 x 16GB": false, "8 x 32GB": false}
  };

  getList(List<Part> list ,var ranges, var checks){
    List<RAM_Part> ramList = list.cast<RAM_Part>();

    rangeFilters = ranges;
    checkboxFilters = checks;

    return ramList.where((part) =>
    (part.price <= rangeFilters['Price \$']['range'].end)
        &&
        (part.price >= rangeFilters['Price \$']['range'].start)
        &&
        ( double.parse(part.clockSpeed) <= rangeFilters['Speed']['range'].end)
        &&
        ( double.parse(part.clockSpeed) >= rangeFilters['Speed']['range'].start)
        &&
        (checkboxFilters['Manufacturers'][part.manufacturerName] == true)

    ).toList();
  }
}