
import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/GPU.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';

class GPUFilter{

  Map<String, dynamic> rangeFilters = {
    'Price \$' : {'min': 0.0, 'max': 12000.0, 'range': RangeValues(0.0, 12000.0)},
    'Memory GB': {'min': 0.0, 'max': 64.0, 'range': RangeValues(0.0, 64.0)},
    'Core Clock MHz': {'min': 100.0, 'max': 3000.0, 'range': RangeValues(100.0, 3000.0)},
    'Boost Clock MHz': {'min': 500.0, 'max': 3000.0, 'range': RangeValues(500.0, 3000.0)},
    'Length mm': {'min': 50.0, 'max': 400.0,'range': RangeValues(50.0, 400.0)},
  };

  Map<String, dynamic> checkboxFilters = {

    'Manufacturers': {"All": true, "AMD": false, "AsRock": false, "Asus": false, "Biostar": false,
      "Colorful": false, "ECS": false, "EVGA": false, "Gigabyte": false,
      "MSI": false, "NVIDIA": false, "PowerColor": false, "Sapphire": false,
      "XFX": false, "Zotac": false},


    'Memory Type': {"DDR": false, "DDR2": false, "DDR3": false, "DDR4": false,
      "GDDR2": false, "GDDR3": false, "GDDR5": false, "GDDR5X": false,
      "GDDR6": false, "GDDR6X": false, "HBM": false, "HBM2": false}

  };


  getList(List<Part> list ,var ranges, var checks){
    List<GPU_Part> gpuList = list.cast<GPU_Part>();

    rangeFilters = ranges;
    checkboxFilters = checks;

    return gpuList.where((part) =>
        (part.price <= rangeFilters['Price \$']['range'].end)
            &&
        (part.price
            >= rangeFilters['Price \$']['range'].start)
            &&
        ( double.parse(part.vram.replaceAll(' GB', ''))
            <= rangeFilters['Memory GB']['range'].end)
            &&
        ( double.parse(part.vram.replaceAll(' GB', ''))
            >= rangeFilters['Memory GB']['range'].start)
            &&
        (checkboxFilters['Manufacturers'][part.manufacturerName] == true)

    ).toList();
  }
}