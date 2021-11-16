import 'package:quick_pc/pages/build_list/build_list.dart';
import 'dart:convert';
import 'CPU.dart';
import 'Case_Part.dart';
import 'Cooler_Part.dart';
import 'GPU.dart';
import 'Motherboard_Part.dart';
import 'Part.dart';
import 'PSU_Part.dart';
import 'Part.dart';
import 'Part.dart';
import 'RAM_Part.dart';
import 'Storage_Part.dart';

class CompletePCBuild {
  String buildID;
  String buildUserID;
  String buildName;
  double price;
  double buildBudget;
  List<Part> partList;
  List<double> priceList;

  CompletePCBuild() {
    this.buildName = 'i got no name';
    this.price = 0;
    this.buildBudget = 0;
    this.partList = [
      CPU_Part(), Motherboard_Part(), RAM_Part(), GPU_Part(),
      PSU_Part(), Cooler_Part(), Storage_Part(), Case_Part(),
    ];
    this.updatePrice();
  }

  CompletePCBuild.fromDatabase(String buildUserID, String buildName, double price, double buildBudget, List<Part> partList) {
    this.buildUserID = buildUserID;
    this.buildName = buildName;
    this.price = price;
    this.buildBudget = buildBudget;
    this.partList = partList;

    this.updatePrice();

  }

  CompletePCBuild.demoConstructor() {
    this.partList = demoList;
    this.updatePrice();

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

  Map<String, dynamic> toJson() {
    List<Map> partList =
    this.partList != null ? this.partList.map((i) => i.toJson()).toList() : null;
    return {
      "buildUserID": buildUserID.toString(),
      "buildName" : buildName.toString(),
      "price" : price.toString(),
      "buildBudget": buildBudget.toString(),
      "partList" : partList,
    };
  }

  factory CompletePCBuild.fromJson(Map<dynamic, dynamic> json) {
    if(json['partList'] != null) {
      var templist = json['partList'] as List;
      List<Part> _partList = templist.map((e) => Part.fromJson(e)).toList();

      return CompletePCBuild.fromDatabase(
          json['buildUserID'] as String,
          json['buildName'] as String,
          json['price'] as double,
          json['buildBudget'] as double,
          _partList
      );
    }
    else {
      return CompletePCBuild.fromDatabase(
          json['buildUserID'] as String,
          json['buildName'] as String,
          json['price'] as double,
          json['buildBudget'] as double,
          null
      );
    }
    return null;
  }


}