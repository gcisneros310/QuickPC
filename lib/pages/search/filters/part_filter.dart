import 'package:quick_pc/models/PCPartClasses/Part.dart';
import 'package:quick_pc/pages/search/filters/gpu_filter.dart';
import 'package:quick_pc/pages/search/filters/mobo_filter.dart';
import 'package:quick_pc/pages/search/filters/ram_filter.dart';

import 'cpu_filter.dart';

class Filter {

  Map<String, dynamic> rangeFilters;
  Map<String, dynamic> checkboxFilters;

  Filter(String partType){

    switch (partType){
      case 'cpu':
        rangeFilters = CPUFilter().rangeFilters;
        checkboxFilters = CPUFilter().checkboxFilters;
        break;

      case 'gpu':
        rangeFilters = GPUFilter().rangeFilters;
        checkboxFilters = GPUFilter().checkboxFilters;
        break;

      case 'ram':
        rangeFilters = RAMFilter().rangeFilters;
        checkboxFilters = RAMFilter().checkboxFilters;
        break;

      case 'motherboard':
        rangeFilters = MotherboardFilter().rangeFilters;
        checkboxFilters = MotherboardFilter().checkboxFilters;
        break;

      case 'storage':
        break;

      case 'case':
        break;

      case 'psu':
        break;

    }
  }

  getFilteredList(List<Part> list, String partType){

    switch (partType){
      case 'cpu':
        return null;

      case 'gpu':
        return GPUFilter().getList(list, rangeFilters, checkboxFilters);

      case 'ram':
        return null;

      case 'motherboard':
        return null;

      case 'storage':
        return null;

      case 'case':
        return null;

      case 'psu':
        return null;
    }

  }

}