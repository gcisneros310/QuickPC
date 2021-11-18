
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/models/PCPartClasses/CPU.dart';
import 'package:quick_pc/models/PCPartClasses/CompletePCBuild.dart';
import 'package:quick_pc/models/PCPartClasses/GPU.dart';
import 'package:quick_pc/models/PCPartClasses/PCPart.dart';
import 'package:quick_pc/pages/universal_drawer/NavigationDrawer.dart';
import 'package:quick_pc/presentation/p_c_part_info_icons_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'build_list.dart';
class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({this.text, this.icon});
}

class MenuItems {
  static const addPartMenuItem = MenuItem(text: 'Add Part to List', icon: Icons.money);
  static const priceHistory = MenuItem(text: 'View Price History', icon: Icons.bar_chart);
  static const List<MenuItem> menuItemsList = [
    addPartMenuItem,
    priceHistory,
  ];
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}


class PCPartInfoPage extends StatefulWidget {
  final Part part;
  final String partType;

  PCPartInfoPage({Key key, this.part, this.partType}) : super(key: key);

  PCPartInfoPage.loadPartInfo(CompletePCBuild buildObject, this.part, this.partType) :super() {}

  @override
  _PCPartInfoPageState createState() => _PCPartInfoPageState();
}



List<DataColumn> getColumns(List<String> columns) => columns.map((String column) => DataColumn(label: Text(column),)).toList();

Widget buildDataTable(){
  final columns = ['Type', 'Price', 'Date'];

}


class _PCPartInfoPageState extends State<PCPartInfoPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Color logoColor = Color(0xff66c290);


  List<SalesData> _chartData;

  @override
  void initState() {
   _chartData =  getChartData();
   super.initState();
  }

  var attributeNames = [
    "Manufacturer",
    "Base Clock",
    "Boost Clock",
    "Core Count"
  ];

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(1, 1198.88),
      SalesData(2, 1499.99),
      SalesData(3, 1320.22),
      SalesData(4, 1499.99),
      SalesData(5, 1235.99),
      SalesData(6, 1279.99),
      SalesData(7, 1100.99),
      SalesData(8, 1150.99),
      SalesData(9, 1250.99),
      SalesData(10, 1227.99),
      SalesData(11, 1289.99),


   /*   SalesData("Jan", 35),
      SalesData("Feb", 28),
      SalesData("Mar", 40),
      SalesData("Apr", 40),
      SalesData("May", 34),
      SalesData("Jun", 32),
      SalesData("Jul", 40),
      SalesData("Aug", 40),
      SalesData("Sep", 40),
      SalesData("Oct", 40),
      SalesData("Nov", 40),
      SalesData("Dec", 40),*/
    ];
    return chartData;
  }


  @override
  Widget build(BuildContext context) {
    CPU_Part cpuObj = widget.part;
    String partName = "part";
    double partPrice = 1.0;
    double clock;
    double boost;
    int cores;


    switch (widget.partType) {
      case 'cpu':
        CPU_Part cpu = widget.part;
        partName = cpu.partName;
        partPrice = cpu.price;
        clock = cpu.base_clock;
        boost = cpu.boost_clock;
        cores = cpu.coreCount;
        break;
      case 'gpu':
        GPU_Part gpu = widget.part;
        break;
    }

    createAlertDialog(BuildContext context) {
      return showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text("Add Part to List?"),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text("Yes"),
              onPressed: (){
                setState(() {
                  CompletePCBuild tempObj = new CompletePCBuild();
                  tempObj.partList[0] = cpuObj;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => PartList(tempObj)

                    )
                  );
                });
              },
            ),
            MaterialButton(
              elevation: 5.0,
              child: Text("No"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
      );
    }

    AlertDialog onSelected(BuildContext context, MenuItem item) {
      switch(item) {
        case MenuItems.addPartMenuItem:
          print("the settings button do be getting clicked tho...");
          createAlertDialog(context);
          // return SimpleDialog(
          //   title: Text("FUCK THIS"),
          // );
          break;
        case MenuItems.priceHistory:
          createAlertDialog(BuildContext context) {
            return showDialog(context: context, builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Constants.padding),
                ),
                title: Text("Price History"),
                content: Container(
                    height: 700,
                    width: 500,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: 350,
                          child: SfCartesianChart(
                            //primaryXAxis: DateTimeAxis(),
                            series: <ChartSeries>[
                              LineSeries<SalesData, double>(
                                  dataSource: getChartData(),
                                  xValueMapper: (SalesData sales, _) => sales.year,
                                  yValueMapper: (SalesData sales, _) => sales.sales,
                              ),

                            ],
                          ),
                        ),
                        DataTable(
                          columns: getColumns(["Type", "Price", "Date"]),
                          rows: [
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('Current')),
                                DataCell(Text('\$1,289.99')),
                                DataCell(Text('-')),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('Highest',style: TextStyle(color: Colors.red))),
                                DataCell(Text('\$1,499.99',style: TextStyle(color: Colors.red))),
                                DataCell(Text('-')),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('Lowest',style: TextStyle(color: Colors.green)),),
                                DataCell(Text('\$1073.93',style: TextStyle(color: Colors.green))),
                                DataCell(Text('-')),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('Average')),
                                DataCell(Text('\$1,209.66')),
                                DataCell(Text('-')),
                              ],
                            ),
                          ],
                        ),


                   /*    Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Test123",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Text123",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),*/

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
      drawer: SafeArea(child: NavigationDrawer()),
      appBar: AppBar(
        title: (Text("Info Page")),
        backgroundColor: logoColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 4,

        actions: [
          PopupMenuButton<MenuItem>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              ...MenuItems.menuItemsList.map(buildItem).toList(),
            ],
          )
        ],

      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     // Navigator.push(
      //     //     context,
      //     //     // MaterialPageRoute(builder: (context) => BuildGuideList())
      //     // );
      //   },
      //   icon: Icon(Icons.arrow_forward),
      //   label: const Text("Go to Guide"),
      //   backgroundColor: logoColor,
      // ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: Image.network(
                    cpuObj.productImageURL,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: Text(
                    cpuObj.partName,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: Text(
                    "\$" + cpuObj.price.toString(),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Divider(
                  height: 5,
                  thickness: 4,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: Container(
                    width: double.infinity,
                    height: 260,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                        itemCount: cpuObj.partAttributeMap.length,
                        itemBuilder: (BuildContext context, int index) {
                        return Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFFF5F5F5),
                          child: Container(
                            width: 100,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  attributeNames[index],
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  cpuObj.partAttributeMap[index].toString(),
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                )
              ],
            ),
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
