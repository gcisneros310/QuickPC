
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/models/PCPartClasses/CPU.dart';
import 'package:quick_pc/models/PCPartClasses/CompletePCBuild.dart';
import 'package:quick_pc/models/PCPartClasses/GPU.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';
import 'package:quick_pc/pages/universal_drawer/NavigationDrawer.dart';
import 'package:quick_pc/presentation/p_c_part_info_icons_icons.dart';

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({this.text, this.icon});
}

class MenuItems {
  static const addPartMenuItem = MenuItem(text: 'Add Part to List', icon: Icons.money);
  static const List<MenuItem> menuItemsList = [
    addPartMenuItem,
  ];
}

class TrendingPopular extends StatefulWidget {
  final Part part;
  final String partType;

  TrendingPopular({Key key, this.part, this.partType}) : super(key: key);

  TrendingPopular.loadPartInfo(CompletePCBuild buildObject, this.part, this.partType) :super() {

  }

  @override
  _TrendingPopularState createState() => _TrendingPopularState();
}

class _TrendingPopularState extends State<TrendingPopular> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Color logoColor = Color(0xff66c290);

  var attributeNames = [
    "Manufacturer",
    "Base Clock",
    "Boost Clock",
    "Core Count"
  ];

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


    return Scaffold(
      key: scaffoldKey,
      drawer: SafeArea(child: NavigationDrawer()),
      appBar: AppBar(
        title: (Text("Info Page")),
        backgroundColor: logoColor,
        automaticallyImplyLeading: true,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: Text(
                  "Intel i5",
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
                  "\$499",
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
                      itemCount: 3,
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
                                  "Apple",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "Orange",
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
