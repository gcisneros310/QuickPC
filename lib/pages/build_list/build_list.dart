import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/CPU.dart';
import 'package:quick_pc/models/PCPartClasses/Case_Part.dart';
import 'package:quick_pc/models/PCPartClasses/Cooler_Part.dart';
import 'package:quick_pc/models/PCPartClasses/GPU.dart';
import 'package:quick_pc/models/PCPartClasses/Motherboard_Part.dart';
import 'package:quick_pc/models/PCPartClasses/PCPart.dart';
import 'package:quick_pc/models/PCPartClasses/PSU_Part.dart';
import 'package:quick_pc/models/PCPartClasses/RAM_Part.dart';
import 'package:quick_pc/models/PCPartClasses/Storage_Part.dart';
import 'package:quick_pc/pages/build_list/PCPartInfoPage.dart';
import 'package:quick_pc/pages/build_list/PartCardInfo.dart';
import 'package:quick_pc/presentation/app_icons_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({this.text, this.icon});
}

class MenuItems {
  static const setBudgetMenuItem = MenuItem(text: 'Set a Budget', icon: Icons.money);
  static const showPieChartMenuItem = MenuItem(text: 'Show Price Chart', icon: Icons.pie_chart);
  static const List<MenuItem> menuItemsList = [
    setBudgetMenuItem,
    showPieChartMenuItem
  ];
}

class Constants{
  Constants._();
  static const double padding =20;
  static const double avatarRadius =45;
}

class PartList extends StatefulWidget {
  @override
  _BuildGuideList createState() => _BuildGuideList();
}

class BudgetData {
  String partTitle;
  double totalPrice;
  BudgetData() {
    this.partTitle = null; this.totalPrice = 0;
  }

  BudgetData.loadData(String partTitle, double price) {
    this.partTitle = partTitle; this.totalPrice = price;
  }

  void setBudgetData(var objectList) {

  }
}

var partTitles = [
  'CPU', 'Motherboard', 'RAM', 'GPU', 'Power Supply',
  'Cooler', 'Hard Drive', 'Case'
];

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
    
    double returnTotalPrice() {
      double temp = 0;
      for(int x = 0; x < this.partList.length; x++) {
        temp += this.partList[x].price;
      }
      return temp;
    }
  }

  List<BudgetData> getPriceList() {
    List<BudgetData> temp = [];
    for (int x = 0; x < partList.length; x++) {
      BudgetData tempObj = BudgetData.loadData(partTitles[x], partList[x].price);
      temp.add(tempObj);
    }
    return temp;
  }
}

class _BuildGuideList extends State<PartList> {
  CompletePCBuild buildObject = new CompletePCBuild();


  TextEditingController budgetEntryController = new TextEditingController();
  createAlertDialog(BuildContext context) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Set your Budget"),
        content: TextField(
          keyboardType: TextInputType.number,
          controller: budgetEntryController,
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
              child: Text("Submit"),
            onPressed: (){
              buildObject.price = double.parse(budgetEntryController.text);
              print(buildObject.price.runtimeType);
              Navigator.of(context).pop();
            },
          ),
          MaterialButton(
            elevation: 5.0,
            child: Text("Cancel"),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
        ],
      );
    }
    );
  }



  var iconsList = [
    StepIcons.question_mark, StepIcons.power_supply, StepIcons.processor,
    StepIcons.ram, StepIcons.motherboard, StepIcons.cooler,
    StepIcons.gpu, StepIcons.gpu, StepIcons.slave_hard_drive,
    StepIcons.power_plug, StepIcons.power_button,
  ];

  

  var partObjects = [
    CPU_Part(), Motherboard_Part(), RAM_Part(), GPU_Part(),
    PSU_Part(), Cooler_Part(), Storage_Part(), Case_Part(),
  ];

  List<BudgetData> loadPrices() {
    List<BudgetData> tempList = [];
    for(int x = 0; x < partObjects.length; x++)
      {
        BudgetData tempObj = BudgetData.loadData(partTitles[x], 2.0 * (x + 1));
        tempList.add(tempObj);
      }
    return tempList;
  }

  List getStepTitles() {
    var stepInfo = [];
    for (var i = 0; i < partTitles.length; i++) {
      PartCardInfo temp = PartCardInfo(
          partCategoryTitle : partTitles[i],
          partTitle: partObjects[i].partName,
        price: buildObject.partList[i].price.toString()
      );
      stepInfo.add(temp);
    }
    return stepInfo;
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List<BudgetData> pieChartInfo = buildObject.getPriceList();

    final Color logoColor = Color(0xff66c290);
    var partInfo = getStepTitles();

    ListTile makeListTile(PartCardInfo lesson, var listIndex) => ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24)
            )
        ),
        child: Icon(
          iconsList[listIndex],
          color: Colors.white,
          size: 42,
        ),
      ),
      title: Text(
        lesson.partCategoryTitle,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
        ),
      ),
      subtitle: Row(
        children: <Widget>[
          Expanded(
              flex: 4,
              child: Text(
                  lesson.partTitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13
                  )
              )
          ),

        ],
      ),
      trailing:
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                              'Price',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              )
                          ),
                          Text(
                              partObjects[listIndex].price.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              )
                          ),
                        ]
                    )
                ),
                Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),

              ],
            )
          ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PCPartInfoPage()));
      }
      );

    Card makeCard(PartCardInfo lesson, var listIndex) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: makeListTile(lesson, listIndex),
      ),
    );

    final makeBody = Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Container(
          // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: partTitles.length,
            itemBuilder: (BuildContext context, int index) {
              return makeCard(partInfo[index], index);
            },
          ),
        )
    );

    AlertDialog onSelected(BuildContext context, MenuItem item) {
      switch(item) {
        case MenuItems.setBudgetMenuItem:
          print("the settings button do be getting clicked tho...");
          createAlertDialog(context);
          // return SimpleDialog(
          //   title: Text("FUCK THIS"),
          // );
          break;
        case MenuItems.showPieChartMenuItem:
          createAlertDialog(BuildContext context) {
            return showDialog(context: context, builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Constants.padding),
                ),
                title: Text("PC Part Price Pie Chart"),
                content: Container(
                    height: 600,
                    width: 400,
                    child: Column(
                      children: [
                        SfCircularChart(

                          series: <CircularSeries>[
                            PieSeries<BudgetData, String>(
                              dataSource: pieChartInfo,
                              xValueMapper: (BudgetData data, _) => data.partTitle,
                              yValueMapper: (BudgetData data, _) => data.totalPrice,
                              radius: '100%',
                                dataLabelMapper: (BudgetData data, _) => data.totalPrice.toString(),
                                dataLabelSettings: DataLabelSettings(
                                    isVisible: true
                                )
                            )
                          ],
                          legend: Legend(
                              isVisible: true,
                              overflowMode: LegendItemOverflowMode.scroll
                          ),
                        ),
                        Divider(),
                      ],
                    )
                ),
                actions: <Widget>[
                  MaterialButton(
                    elevation: 5.0,
                    child: Text("Exit"),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            }
            );
          }
          createAlertDialog(context);
          break;
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[700],
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("PC Part List"),
        backgroundColor: logoColor,
        centerTitle: true,
        elevation: 4,
          actions: [
            PopupMenuButton<MenuItem>(
              onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  ...MenuItems.menuItemsList.map(buildItem).toList(),
                ],
            )
          ]
      ),
      persistentFooterButtons: [
        Container(
          color: logoColor,
          height: 50,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: Text(
                          "Total price:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          )
                      )
                  ),
                  Container(
                      child: Text(
                          '\$' + buildObject.price.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          )
                      )
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: Text(
                          "Budget set:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          )
                      )
                  ),
                  Container(
                      child: Text(
                          '\$' + buildObject.buildBudget.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          )
                      )
                  ),
                ],
              ),
            ]
          ),
        )
      ],
      body: makeBody,
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
    value: item,
    child: Row(
        children:[
          Icon(
              item.icon,
              color: Colors.black,
              size: 18
          ),
          const SizedBox(width:12),
          Text(item.text),
        ]
    ),
  );
}