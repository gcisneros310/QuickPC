import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/models/PCPartClasses/CPU.dart';
import 'package:quick_pc/models/PCPartClasses/CompletePCBuild.dart';
import 'package:quick_pc/models/PCPartClasses/GPU.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';
import 'package:quick_pc/models/review_data.dart';
import 'package:quick_pc/pages/part_review/Create_Star.dart';
import 'package:quick_pc/pages/part_review/review_list.dart';
import 'package:quick_pc/pages/part_review/star.dart';
import 'package:quick_pc/pages/universal_drawer/NavigationDrawer.dart';
import 'package:quick_pc/presentation/p_c_part_info_icons_icons.dart';
import 'package:quick_pc/shared/loading.dart';

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
  CompletePCBuild buildObj;
  PCPartInfoPage({Key key, this.part, this.partType, this.buildObj}) : super(key: key);

  PCPartInfoPage.loadPartInfo(CompletePCBuild buildObject, this.part, this.partType) :super() {}

  @override
  _PCPartInfoPageState createState() => _PCPartInfoPageState();
}

class _PCPartInfoPageState extends State<PCPartInfoPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Color logoColor = Color(0xff66c290);
  final fb = FirebaseDatabase.instance;

  var attributeNames = [
    "Manufacturer",
    "Base Clock",
    "Boost Clock",
    "Core Count"
  ];

  Future<List<Review_Data>> getPartRating() async {
    List<Review_Data> temp_reviews = [];
    await fb
        .reference()
        .child("reviews")
        .child(widget.part.partName.hashCode.toString())
        .orderByKey()
        .once().then((result) async {
      if (result.value != null) {
        result.value.forEach((key, childSnapshot) {
          temp_reviews.add(Review_Data.fromJson(Map.from(childSnapshot)));
        });
      } else {
        print("get didn't work for reviews");
      }
    }).catchError((e) {
      print("error on reviews: $e");
    });

    return temp_reviews;
  }


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
                  CompletePCBuild tempObj = widget.buildObj;
                  print(tempObj.partList);
                  tempObj.partList[returnPartIndex(widget.partType)] = widget.part;
                  tempObj.calculatePowerDraw();
                  Navigator.pushReplacement(
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

    return FutureBuilder(
        future: getPartRating(),
        builder: (context, projectSnap) {

          if (projectSnap.connectionState == ConnectionState.none &&
              projectSnap.hasData == null && projectSnap.data == null) {
            //print('project snapshot data is: ${projectSnap.data}');
            return Loading();
          }
          if (projectSnap.data == null) {
            print("IF PROJECTSNAP.HASDATA");
            print(projectSnap.data.runtimeType);
            return Loading();
          }
          else {

            double result = 0;
            for (int i = 0; i < projectSnap.data.length; i++)
            {
              result += projectSnap.data[i].partRating;
            }
            double average_rating = result/projectSnap.data.length;
            if (average_rating.isNaN){
              average_rating = 0;
            }
            print(average_rating);

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
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {Navigator.push(context,
                                MaterialPageRoute(builder: (_) => ReviewlistWidget(
                                    partName: widget.part.partName.toString())));},
                            child: Text(
                              "View Reviews",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                color: Colors.blue,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Row(
                            children: <Widget>[
                              StarRating(rating: average_rating,),
                              Text(
                                average_rating.toStringAsFixed(1).toString(),
                                style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                              ),)
                            ],
                          )
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Text(
                            "\$" +  widget.part.price.toStringAsFixed(2).toString(),
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
        }

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

  int returnPartIndex(String partType) {
    switch(partType) {
      case "cpu":
        return 0;
        break;
      case "motherboard":
        return 1;
        break;
      case "memory":
        return 2;
        break;
      case "gpu":
        return 3;
        break;
      case "psu":
        return 4;
        break;
      case "cooler":
        return 5;
        break;
      case "storage":
        return 6;
        break;
      case "case":
        return 7;
        break;
      default:
        return null;
    }
  }
}

var partTypes = [
  'cpu',
  'motherboard',
  'memory',
  'gpu',
  'psu',
  'cooler',
  'storage',
  'case'
];