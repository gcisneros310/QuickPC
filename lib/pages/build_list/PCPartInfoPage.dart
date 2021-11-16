import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/models/PCPartClasses/CPU.dart';
import 'package:quick_pc/models/PCPartClasses/CompletePCBuild.dart';
import 'package:quick_pc/models/PCPartClasses/GPU.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';
import 'package:quick_pc/pages/universal_drawer/NavigationDrawer.dart';
import 'package:quick_pc/presentation/p_c_part_info_icons_icons.dart';

import 'build_list.dart';
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

class PCPartInfoPage extends StatefulWidget {
  final Part part;
  final String partType;

  PCPartInfoPage({Key key, this.part, this.partType}) : super(key: key);

  PCPartInfoPage.loadPartInfo(CompletePCBuild buildObject, this.part, this.partType) :super() {}

  @override
  _PCPartInfoPageState createState() => _PCPartInfoPageState();
}

class _PCPartInfoPageState extends State<PCPartInfoPage> {
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


    var attributes = widget.part.partAttributeMap;
    print(attributes);

    List attributeTitles = attributes.keys.toList();
    attributeTitles.remove("images");
    attributeTitles.remove("stores");
    attributeTitles.remove("name");



    // CPU_Part cpuObj = widget.part;
    // String partName = "part";
    // double partPrice = 1.0;
    // double clock;
    // double boost;
    // int cores;

    // switch (widget.partType) {
    //   case 'cpu':
    //     CPU_Part cpu = widget.part;
    //     partName = cpu.partName;
    //     partPrice = cpu.price;
    //     clock = cpu.base_clock;
    //     boost = cpu.boost_clock;
    //     cores = cpu.coreCount;
    //     break;
    //   case 'gpu':
    //     GPU_Part gpu = widget.part;
    //     break;
    // }

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
                  tempObj.partList[0] = widget.part;
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
                    widget.part.productImageURL,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: Text(
                    widget.part.partName,
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
                    "\$" +  widget.part.price.toString(),
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
                        itemCount: attributeTitles.length,
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
                                    attributeTitles[index].toUpperCase(),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    attributes[attributeTitles[index]].toString(),
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