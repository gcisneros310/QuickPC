import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/models/ChartModels/WattageData.dart';
import 'package:quick_pc/models/PCPartClasses/CompletePCBuild.dart';
import 'package:quick_pc/pages/build_list/build_list.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

var partTitles = [
  'CPU', 'Motherboard', 'RAM', 'GPU', 'Power Supply',
  'Cooler', 'Hard Drive', 'Case'
];


class Constants{
  Constants._();
  static const double padding =20;
  static const double avatarRadius =45;
}


class BuildChartsPage extends StatefulWidget {
  CompletePCBuild buildObject;
  List<BudgetData> pieChartInfo;
  BuildChartsPage({Key key}) : super(key: key);
  BuildChartsPage.passInfo(CompletePCBuild tempObj) {
    this.buildObject = tempObj;
  }

  @override
  _BuildChartsPageState createState() => _BuildChartsPageState();
}

class _BuildChartsPageState extends State<BuildChartsPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    CompletePCBuild buildObj = widget.buildObject;
    buildObj.updatePrice();
    List<BudgetData> chartInfo = buildObj.getPriceList();
    TooltipBehavior _toolTipBehavior = TooltipBehavior(enable: true);

    List<WattageData> wattageData = widget.buildObject.getWattageList();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF66C290),
        automaticallyImplyLeading: true,
        title: Text(
          'Build Charts',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Pie Chart',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SfCircularChart(
                    series: <CircularSeries>[
                      PieSeries<BudgetData, String>(
                          dataSource: chartInfo,
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
                        height: "100",
                        orientation: LegendItemOrientation.auto,
                        position: LegendPosition.bottom,
                        isVisible: true,
                        overflowMode: LegendItemOverflowMode.scroll
                    ),
                    tooltipBehavior: _toolTipBehavior,
                  ),
                  Text(
                    'Wattage Graph',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(minimum: 0, maximum: 500, interval: 50),
                    series: <ChartSeries>[
                      BarSeries<WattageData, String>(
                        dataSource: wattageData,
                        xValueMapper: (WattageData data, _) => data.graphTitle,
                        yValueMapper: (WattageData data, _) => data.wattage,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
