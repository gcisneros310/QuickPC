
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
import 'package:quick_pc/services/auth.dart';
import 'package:quick_pc/pages/build_guide/step.dart';
import 'package:quick_pc/presentation/app_icons_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

final Color logoColor = Color(0xff66c290);

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

class PartList extends StatefulWidget {
  PartList({Key key}) : super(key: key);

  @override
  _PartListState createState() => _PartListState();
}

var partTitles = [
  'CPU', 'Motherboard', 'RAM', 'GPU', 'Power Supply',
  'Cooler', 'Hard Drive', 'Case'
];

var iconsList = [
  StepIcons.question_mark, StepIcons.power_supply, StepIcons.processor,
  StepIcons.ram, StepIcons.motherboard, StepIcons.cooler,
  StepIcons.gpu, StepIcons.gpu, StepIcons.slave_hard_drive,
  StepIcons.power_plug, StepIcons.power_button,
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

class _PartListState extends State<PartList> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
              setState(() {
                buildObject.price = double.parse(budgetEntryController.text);
                print(buildObject.price.runtimeType);
                Navigator.of(context).pop();
              });
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

  @override
  Widget build(BuildContext context) {
    List<BudgetData> pieChartInfo = buildObject.getPriceList();

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
      backgroundColor: Color(0xFFF5F5F5),
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
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 8.0,
                  child: Container(
                    width: 100,
                    height: 195,
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8,8,8,0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Image.network(
                                  buildObject.partList[index].productImageURL,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 200,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0x4f4f4f),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        partTitles[index],
                                        style:
                                        TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        buildObject.partList[index].partName,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "\$" + buildObject.partList[index].price.toString(),
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                child: Text('Search Part'),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.teal,
                                  onSurface: Colors.grey,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                child: Text('Remove Selection'),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.teal,
                                  onSurface: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          ),
        ),
      ),
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
