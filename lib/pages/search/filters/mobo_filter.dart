import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/Motherboard_Part.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';

class MotherboardFilter{

  Map<String, dynamic> rangeFilters = {
    'Price \$' : {'min': 0.0, 'max': 12000.0, 'range': RangeValues(0.0, 12000.0)},
    'Max Memory': {'min': 2.0, 'max': 2000.0, 'range': RangeValues(2.0, 2000.0)},
    'Memory Slots': {'min': 1.0, 'max': 16.0, 'range': RangeValues(1.0, 16.0)},
  };

  Map<String, dynamic> checkboxFilters = {

    'Manufacturers': {"AsRock": false, "Asus": false, "Biostar": false,
      "Colorful": false, "ECS": false, "EVGA": false, "Foxconn": false,
      "Gigabyte": false, "Intel": false, "Jetway": false, "MSI""NZXT": false,
      "Sapphire": false, "Supermicro": false, "XFX": false, "Zotac": false},

    'Form Factor': {"ATX": false, "EATX": false, "Flex ATX": false, "HPTX": false,
      "Micro ATX": false, "Mini ITX": false, "Thin Mini ITX": false, "Mini DTX": false,
      "SSI CEB": false, "SSI EEB": false, "XL ATX": false},

    'Socket': {"AM1": false, "AM2": false, "AM2+/AM2": false, "AM3": false,
      "AM3+": false, "AM3+/AM3": false, "AM3/AM2+": false, "AM3/AM2+/AM2": false,
      "AM4": false, "FM1": false, "FM2": false, "FM2+": false, "LGA775": false,
      "LGA1150": false, "LGA1151": false, "LGA1155": false, "LGA1156": false,
      "LGA1200": false, "LGA1366": false, "LGA1700": false, "LGA2011": false,
      "LGA2011-3": false, "LGA2011-3 Narrow": false, "LGA2066": false,}
  };

  getList(List<Part> list ,var ranges, var checks){
    List<Motherboard_Part> moboList = list.cast<Motherboard_Part>();

    rangeFilters = ranges;
    checkboxFilters = checks;

    return moboList.where((part) =>
    (part.price <= rangeFilters['Price \$']['range'].end)
        &&
        (part.price >= rangeFilters['Price \$']['range'].start)
        &&
        (checkboxFilters['Manufacturers'][part.manufacturerName] == true)
        &&
        (checkboxFilters['Socket'][part.cpuSocket] == true)

    ).toList();
  }
}