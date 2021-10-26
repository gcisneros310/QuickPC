import 'package:quick_pc/pages/build_list/build_list.dart';

import 'CPU.dart';
import 'Case_Part.dart';
import 'Cooler_Part.dart';
import 'GPU.dart';
import 'Motherboard_Part.dart';
import 'PCPart.dart';
import 'PSU_Part.dart';
import 'RAM_Part.dart';
import 'Storage_Part.dart';

class CompletePCBuild {
  double price;
  double buildBudget;
  List<Part> partList;
  List<double> priceList;

  CompletePCBuild() {
    this.price = 0;
    this.buildBudget = 0;
    this.partList = [
      CPU_Part(), Motherboard_Part(), RAM_Part(), GPU_Part(),
      PSU_Part(), Cooler_Part(), Storage_Part(), Case_Part(),
    ];
  }

  CompletePCBuild.demoConstructor() {
    this.partList = demoList;
  }

  List<BudgetData> getPriceList() {
    List<BudgetData> temp = [];
    for (int x = 0; x < partList.length; x++) {
      BudgetData tempObj = BudgetData.loadData(partTitles[x], partList[x].price);
      temp.add(tempObj);
    }
    return temp;
  }

  void updatePrice() {
    double temp = 0;
    for(int x = 0; x < this.partList.length; x++) {
      temp += this.partList[x].price;
    }
    this.price = temp;
  }
}