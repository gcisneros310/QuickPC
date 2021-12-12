import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/PSU_Part.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';

class PSUFilter{

  Map<String, dynamic> rangeFilters = {
    'Price \$' : {'min': 0.0, 'max': 12000.0, 'range': RangeValues(0.0, 12000.0)},
    'Wattage W': {'min':180.0, 'max': 2000.0, 'range': RangeValues(180.0, 2000.0)},
    // 'Length mm': {'min': 90.0, 'max': 250.0, 'range': RangeValues(90.0, 250.0)},
  };

  Map<String, dynamic> checkboxFilters = {

    'Rating': {"80+ Titanium": true, "80+ Platinum": true, "80+ Gold": true,
      "80+ Silver": true, "80+ Bronze": true, "80+": true},

    'Form': {"ATX": true, "SFX": true},

    'Modular': {"Full": true, "No": true, "Semi": true}
  };

  getList(List<Part> list ,var ranges, var checks){
    List<PSU_Part> ramList = list.cast<PSU_Part>();

    rangeFilters = ranges;
    checkboxFilters = checks;

    return ramList.where((part) =>
    (part.price <= rangeFilters['Price \$']['range'].end)
        &&
    (part.price >= rangeFilters['Price \$']['range'].start)
    &&
    (part.wattage <= rangeFilters['Wattage W']['range'].end)
    &&
    (part.wattage >= rangeFilters['Wattage W']['range'].start)
    &&
    (checkboxFilters['Rating'][part.efficiencyRating] == true)
    &&
    (checkboxFilters['Form'][part.partAttributeMap['form']] == true)
    &&
    (checkboxFilters['Modular'][part.modularityType] == true)

    ).toList();
  }
}