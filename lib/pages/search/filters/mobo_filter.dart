import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/Motherboard_Part.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';

class MotherboardFilter{

  Map<String, dynamic> rangeFilters = {
    'Price \$' : {'min': 0.0, 'max': 12000.0, 'range': RangeValues(0.0, 12000.0)},
    'Max Memory': {'min': 2.0, 'max': 512.0, 'range': RangeValues(2.0, 512.0)},
    // 'Memory Slots': {'min': 1.0, 'max': 16.0, 'range': RangeValues(1.0, 16.0)},
  };

  Map<String, dynamic> checkboxFilters = {

    // 'Manufacturers': {"AsRock": true, "Asus": true, "Biostar": true,
    //   "Colorful": true, "ECS": true, "EVGA": true, "Foxconn": true,
    //   "Gigabyte": true, "Intel": true, "Jetway": true, "MSI""NZXT": true,
    //   "Sapphire": true, "Supermicro": true, "XFX": true, "Zotac": true},

    'Form Factor': {"ATX": true, "EATX": true, "Flex ATX": true, "HPTX": true,
      "Micro ATX": true, "Mini ITX": true, "Thin Mini ITX": true, "Mini DTX": true,
      "SSI CEB": true, "SSI EEB": true, "XL ATX": true},

    'Socket': {"AM1": true, "AM2": true, "AM2+": true, "AM3": true,
      "AM3+": true, "AM4": true,  "FM1": true, "FM2": true, "FM2+": true,
      "LGA775": true, "LGA1150": true, "LGA1151": true, "LGA1155": true, "LGA1156": true,
      "LGA1200": true, "LGA1366": true, "LGA1700": true, "LGA2011": true,
      "LGA2011-3": true, "LGA2011-3 Narrow": true, "LGA2066": true,
      "sTR4": true, "sTRX4": true},

      'Memory Type': {"DDR": true, "DDR2": true, "DDR3": true, "DDR4": true,
        "DDR5": true},

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

        (int.parse(part.partAttributeMap['max memory'].replaceAll(" GB", ""))
            <= rangeFilters['Max Memory']['range'].end)
        &&
        (int.parse(part.partAttributeMap['max memory'].replaceAll(" GB", ""))
            >= rangeFilters['Max Memory']['range'].start)
        &&

        // (int.parse(part.partAttributeMap['max slots'])
        //     <= rangeFilters['Memory Slots']['range'].end)
        // &&
        // (int.parse(part.partAttributeMap['max slots'])
        //     >= rangeFilters['Memory Slots']['range'].start)
        // &&

        (checkboxFilters['Socket'][part.cpuSocket] == true)
        &&
        (checkboxFilters['Form Factor'][part.formFactor] == true)
        &&
        (checkboxFilters['Memory Type'][part.partAttributeMap['memory type']] == true)

    ).toList();
  }
}