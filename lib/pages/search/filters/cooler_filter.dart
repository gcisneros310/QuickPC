import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/Cooler_Part.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';

class CoolerFilter{

  Map<String, dynamic> rangeFilters = {
    'Price \$' : {'min': 0.0, 'max': 12000.0, 'range': RangeValues(0.0, 12000.0)},
    'Height mm': {'min':10.0, 'max': 180.0, 'range': RangeValues(10.0, 180.0)}
  };

  Map<String, dynamic> checkboxFilters = {

    // 'Socket': {"AM1": false, "AM2": false, "AM2+": false, "AM3": false,
    //   "AM3+": false, "AM4": false,  "FM1": false, "FM2": false, "FM2+": false,
    //   "LGA775": false, "LGA1150": false, "LGA1151": false, "LGA1155": false, "LGA1156": false,
    //   "LGA1200": false, "LGA1366": false, "LGA1700": false, "LGA2011": false,
    //   "LGA2011-3": false, "LGA2011-3 Narrow": false, "LGA2066": false,
    //   "sTR4": false, "sTRX4": false},

    'Water Cooled': {"No": true, "Yes - 120 mm": true, "Yes - 240 mm": true,
      "Yes - 280 mm": true, "Yes - 360 mm": true,}
  };

  getList(List<Part> list ,var ranges, var checks){
    List<Cooler_Part> ramList = list.cast<Cooler_Part>();

    rangeFilters = ranges;
    checkboxFilters = checks;


    return ramList.where((part) =>
        (part.price <= rangeFilters['Price \$']['range'].end)
        &&
        (part.price >= rangeFilters['Price \$']['range'].start)

        &&
        (double.parse(part.partAttributeMap['height'].trim().replaceAll("mm", ""))
            <= rangeFilters['Height mm']['range'].end)
        &&
        (double.parse(part.partAttributeMap['height'].trim().replaceAll("mm", ""))
            >= rangeFilters['Height mm']['range'].start)
        // &&
        // (checkboxFilters['Socket'][part.partAttributeMap['sockets']] == true && )
        &&
        (checkboxFilters['Water Cooled'][part.partAttributeMap['water'].trimLeft()] == true)

    ).toList();
  }
}