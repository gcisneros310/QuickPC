import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/Case_Part.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';

class CaseFilter{

  Map<String, dynamic> rangeFilters = {
    'Price \$' : {'min': 0.0, 'max': 12000.0, 'range': RangeValues(0.0, 12000.0)},
  };

  Map<String, dynamic> checkboxFilters = {

    // 'Mobo Form': {"ATX": true, "EATX": true, "Micro ATX": true,
    //   "Mini ITX": true, "Mini DTX": true},

    'Type': {"ATX Desktop": true, "ATX Full Tower": true, "ATX Mid Tower": true,
      "ATX Mini Tower": true, "ATX Test Bench": true, "HTPC": true,
      "MicroATX Desktop": true, "MicroATX Mid Tower": true,
      "MicroATX Mini Tower": true, "MicroATX Slim": true,
      "Mini ITX Desktop": true, "Mini ITX Test Bench": true, "Mini ITX Tower": true},

    'Side Panel': {"None": true, "Acrylic": true, "Mesh": true,
      "Tinted Acrylic": true, "Tempered Glass": true, "Tinted Tempered Glass": true}
  };

  getList(List<Part> list ,var ranges, var checks){
    List<Case_Part> ramList = list.cast<Case_Part>();

    rangeFilters = ranges;
    checkboxFilters = checks;


    return ramList.where((part) =>
        (part.price <= rangeFilters['Price \$']['range'].end)
        &&
        (part.price >= rangeFilters['Price \$']['range'].start)

        // &&
        // (checkboxFilters['Mobo Form'][part.motherboardFormFactor] == true)
        &&
        (checkboxFilters['Type'][part.partAttributeMap['type']] == true)
        &&
        (checkboxFilters['Side Panel'][part.partAttributeMap['side panel']] == true)


    ).toList();
  }
}