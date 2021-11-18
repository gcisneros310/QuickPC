import 'package:quick_pc/models/ChartModels/WattageData.dart';
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
  int totalPowerDraw;
  double buildBudget;
  List<Part> partList;
  List<double> priceList;

  CompletePCBuild() {
    this.buildName = 'i got no name';
    this.price = 0;
    this.buildBudget = 0;
    this.partList = [
      CPU_Part(),
      Motherboard_Part(),
      RAM_Part(),
      GPU_Part(),
      PSU_Part(),
      Cooler_Part(),
      Storage_Part(),
      Case_Part(),
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
    this.calculatePowerDraw();
  }

  CompletePCBuild.demoConstructor() {
    this.partList = demoList;
    this.updatePrice();
    this.calculatePowerDraw();
  }

  List<BudgetData> getPriceList() {
    List<BudgetData> temp = [];
    for (int x = 0; x < partList.length; x++) {
      BudgetData tempObj = BudgetData.loadData(partTitles[x], partList[x].price);
      temp.add(tempObj);
    }
    return temp;
  }

  List<WattageData> getWattageList() {
    PSU_Part temp;
    if (this.partList[4] is PSU_Part) {
       temp = this.partList[4];

    }
    return [
      WattageData(graphTitle: "CPU", wattage: this.partList[0].tdp),
      WattageData(graphTitle: "GPU", wattage: this.partList[3].tdp),
      WattageData(graphTitle: "PSU Limit", wattage: temp.wattage),
      WattageData(graphTitle: "Build TDP", wattage: this.totalPowerDraw)
    ];
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
      "price" : price,
      "buildBudget": buildBudget,
      "partList" : partList,
    };
  }

  factory CompletePCBuild.fromJson(Map<dynamic, dynamic> json) {
    if(json['partList'] != null) {
      var templist = json['partList'] as List;
      List<Part> temp = [];
      for(int x = 0; x < templist.length; x++) {
        print("RUNTIME TYPE OF TEMPLIST INDED $x");
        Map<String, dynamic> data = Map.from(templist[x]);

        Part tempPart;
        if(x == 0)
          tempPart = CPU_Part.fromJson(data);
        if(x == 1)
          tempPart = Motherboard_Part.fromJson(data);
        if(x == 2)
          tempPart = RAM_Part.fromJson(data);
        if(x == 3)
          tempPart = GPU_Part.fromJson(data);
        if(x == 4)
          tempPart = PSU_Part.fromJson(data);
        if(x == 5)
          tempPart = Cooler_Part.fromJson(data);
        if(x == 6)
          tempPart = Storage_Part.fromJson(data);
        if(x == 7)
          tempPart = Case_Part.fromJson(data);

        temp.add(tempPart);
        print(tempPart.partName);
        print(tempPart.runtimeType);
      }
      List<Part> _partList = temp;

      return CompletePCBuild.fromDatabase(
          json['buildUserID'] as String,
          json['buildName'] as String,
          json['price'] == null ? 0.0 : json['price'].toDouble(), // forcefully convert int to double,
          json['buildBudget'] == null ? 0.0 : json['buildBudget'].toDouble(),
          _partList
      );
    }
    else {
      return CompletePCBuild.fromDatabase(
          json['buildUserID'] as String,
          json['buildName'] as String,
          json['price'] == null ? 0.0 : json['price'].toDouble(), // forcefully convert int to double,
          json['buildBudget'] == null ? 0.0 : json['buildBudget'].toDouble(), // forcefully convert int to double,
          null
      );
    }
  }

  void calculatePowerDraw() {
     this.totalPowerDraw = this.partList[0].tdp + this.partList[3].tdp;
    print(this.totalPowerDraw);
  }


}