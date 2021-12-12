import 'package:quick_pc/models/PCPartClasses/Part.dart';
import 'package:quick_pc/pages/search/filters/case_filter.dart';
import 'package:quick_pc/pages/search/filters/cooler_filter.dart';
import 'package:quick_pc/pages/search/filters/gpu_filter.dart';
import 'package:quick_pc/pages/search/filters/mobo_filter.dart';
import 'package:quick_pc/pages/search/filters/psu_filter.dart';
import 'package:quick_pc/pages/search/filters/ram_filter.dart';
import 'package:quick_pc/pages/search/filters/storage_filter.dart';

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
        rangeFilters = StorageFilter().rangeFilters;
        checkboxFilters = StorageFilter().checkboxFilters;
        break;

      case 'case':
        rangeFilters = CaseFilter().rangeFilters;
        checkboxFilters = CaseFilter().checkboxFilters;
        break;

      case 'psu':
        rangeFilters = PSUFilter().rangeFilters;
        checkboxFilters = PSUFilter().checkboxFilters;
        break;

      case 'cooler':
        rangeFilters = CoolerFilter().rangeFilters;
        checkboxFilters = CoolerFilter().checkboxFilters;
        break;

    }
  }

  getFilteredList(List<Part> list, String partType){

    switch (partType){
      case 'cpu':
        return CPUFilter().getList(list, rangeFilters, checkboxFilters);

      case 'gpu':
        return GPUFilter().getList(list, rangeFilters, checkboxFilters);

      case 'ram':
        return RAMFilter().getList(list, rangeFilters, checkboxFilters);

      case 'motherboard':
        return MotherboardFilter().getList(list, rangeFilters, checkboxFilters);

      case 'storage':
        return StorageFilter().getList(list, rangeFilters, checkboxFilters);

      case 'case':
        return CaseFilter().getList(list, rangeFilters, checkboxFilters);

      case 'psu':
        return PSUFilter().getList(list, rangeFilters, checkboxFilters);

      case 'cooler':
        return CoolerFilter().getList(list, rangeFilters, checkboxFilters);
    }

  }

  filterByName(List<Part> list, String name){

    return list.where((part) => (part.partName.contains(name))).toList();

  }

}