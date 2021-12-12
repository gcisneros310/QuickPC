import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';
import 'package:quick_pc/models/PCPartClasses/Storage_Part.dart';

class StorageFilter{

  Map<String, dynamic> rangeFilters = {
    'Price \$' : {'min': 0.0, 'max': 12000.0, 'range': RangeValues(0.0, 12000.0)},
    'Capacity GB': {'min':8.0, 'max': 18000.0, 'range': RangeValues(8.0, 18000.0)},
    //'Cache MB': {'min': 2.0, 'max': 5000.0, 'range': RangeValues(2.0, 5000.0)}
  };

  Map<String, dynamic> checkboxFilters = {

    'Type': {"SSD": true, "5400RPM": true, "5900RPM": true, "7200RPM": true,
      "Hybrid": true},

    'Interface': {"SATA 6 Gb/s": true, "SATA 3 Gb/s": true, "PCIe x4": true,
      "M.2 (B+M)": true, "M.2 (M)": true},

    'Form': {"2.5": true, "3.5": true, "M.2-22110": true,
      "M.2-2280": true, "PCI-E": true}
  };

  getList(List<Part> list ,var ranges, var checks){
    List<Storage_Part> ramList = list.cast<Storage_Part>();

    rangeFilters = ranges;
    checkboxFilters = checks;


    return ramList.where((part) =>
        (part.price <= rangeFilters['Price \$']['range'].end)
            &&
        (part.price >= rangeFilters['Price \$']['range'].start)
            &&
        (part.getGB() <= rangeFilters['Capacity GB']['range'].end)
            &&
        (part.getGB() >= rangeFilters['Capacity GB']['range'].start)
            &&
        (checkboxFilters['Type'][part.storageType] == true)
            &&
        (checkboxFilters['Interface'][part.partAttributeMap['interface']] == true)
        &&
        (checkboxFilters['Form'][part.formFactor] == true)


    ).toList();
  }
}