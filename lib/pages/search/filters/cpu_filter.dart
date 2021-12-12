
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

    'Manufacturers': {"AMD": true, "Intel": true},

    'Socket': {"AM1": true, "AM2+": true, "AM3": true, "AM3+": true,
      "AM4": true, "C32": true, "FM1": true, "FM2": true, "FM2+": true,
      "G34": true, "LGA771": true, "LGA775": true, "LGA1150": true,
      "LGA1151": true, "LGA1155": true, "LGA1156": true, "LGA1200": true,
      "LGA1356": true, "LGA1366": true, "LGA2011": true, "LGA2011-3": true,
      "LGA2066": true, "sTR4": true, "sTRX4": true},
    //
    // 'Integrated': {"None": true}
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
        ( part.base_clock <= rangeFilters['Core Clock GHz']['range'].end)
        &&
        ( part.base_clock >= rangeFilters['Core Clock GHz']['range'].start)
        &&
        ( part.boost_clock <= rangeFilters['Boost Clock GHz']['range'].end)
        &&
        ( part.boost_clock >= rangeFilters['Boost Clock GHz']['range'].start)
        &&
        ( part.tdp <= rangeFilters['TDP W']['range'].end)
        &&
        ( part.tdp >= rangeFilters['TDP W']['range'].start)
        &&
        (checkboxFilters['Manufacturers'][part.manufacturerName] == true)
        &&
        (checkboxFilters['Socket'][part.partAttributeMap['socket']] == true)
        // &&
        // (checkboxFilters['Integrated'][part.partAttributeMap['integrated graphics']] == true)

    ).toList();
  }
}