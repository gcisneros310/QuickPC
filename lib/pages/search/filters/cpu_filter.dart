
import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/CPU.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';

class CPUFilter{

  Map<String, dynamic> rangeFilters = {
    'Price \$' : {'min': 0.0, 'max': 12000.0, 'range': RangeValues(0.0, 12000.0)},
    'Core Count': {'min': 1.0, 'max': 64.0, 'range': RangeValues(1.0, 64.0)},
    'Core Clock GHz': {'min': 1.0, 'max': 5.0, 'range': RangeValues(1.0, 5.0)},
    'Boost Clock GHz': {'min': 1.0, 'max': 6.0, 'range': RangeValues(1.0, 6.0)},
    'TDP W': {'min': 10.0, 'max': 300.0,'range': RangeValues(10.0, 300.0)},
  };

  Map<String, dynamic> checkboxFilters = {

    'Manufacturers': {"AMD": false, "Intel": false},

    'Socket': {"AM1": false, "AM2+": false, "AM3": false, "AM3+": false,
      "AM4": false, "C32": false, "FM1": false, "FM2": false, "FM2+": false,
      "G34": false, "LGA771": false, "LGA775": false, "LGA1150": false,
      "LGA1151": false, "LGA1155": false, "LGA1156": false, "LGA1200": false,
      "LGA1356": false, "LGA1366": false, "LGA2011": false, "LGA2011-3": false,
      "LGA2066": false, "sTR4": false, "sTRX4": false}
  };

  getList(List<Part> list ,var ranges, var checks){
    List<CPU_Part> cpuList = list.cast<CPU_Part>();

    rangeFilters = ranges;
    checkboxFilters = checks;

    return cpuList.where((part) =>
    (part.price <= rangeFilters['Price \$']['range'].end)
        &&
        (part.price >= rangeFilters['Price \$']['range'].start)
        &&
        ( part.coreCount <= rangeFilters['Core Count']['range'].end)
        &&
        ( part.coreCount >= rangeFilters['Core Count']['range'].start)
        &&
        (checkboxFilters['Manufacturers'][part.manufacturerName] == true)

    ).toList();
  }
}