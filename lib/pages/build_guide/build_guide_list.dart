import 'package:flutter/material.dart';
import 'package:quick_pc/pages/build_guide/page_files/step_0.dart';
import 'package:quick_pc/pages/build_guide/page_files/step_1.dart';
import 'package:quick_pc/pages/build_guide/page_files/step_10.dart';
import 'package:quick_pc/pages/build_guide/page_files/step_2.dart';
import 'package:quick_pc/pages/build_guide/page_files/step_3.dart';
import 'package:quick_pc/pages/build_guide/page_files/step_4.dart';
import 'package:quick_pc/pages/build_guide/page_files/step_5.dart';
import 'package:quick_pc/pages/build_guide/page_files/step_6.dart';
import 'package:quick_pc/pages/build_guide/page_files/step_7.dart';
import 'package:quick_pc/pages/build_guide/page_files/step_8.dart';
import 'package:quick_pc/pages/build_guide/page_files/step_9.dart';
import 'package:quick_pc/services/auth.dart';
import 'package:quick_pc/pages/build_guide/step.dart';
class BuildGuideList extends StatefulWidget {
  @override
  _BuildGuideList createState() => _BuildGuideList();
}

class _BuildGuideList extends State<BuildGuideList> {
  var stepsListTitlesAndSubTitles = [
    ['Step 0', 'What to Know Before Starting'],
    ['Step 1', 'Install your Power Supply'],
    ['Step 2', 'Install the CPU'],
    ['Step 3', 'Install the RAM'],
    ['Step 4', 'Install the Motherboard'],
    ['Step 5', 'Install the CPU Cooler/Heatsink'],
    ['Step 6', 'Install the Graphics Card'],
    ['Step 7', '(Optional) Install any Optional Devices'],
    ['Step 8', 'Install Storage Devices'],
    ['Step 9', 'Review All Connections'],
    ['Step 10', 'Power on your Computer'],
  ];

  var stepListPageIndexes = [
    Step0_PSU(),
    Step1_PSU(),
    Step2_PSU(),
    Step3_PSU(),
    Step4_PSU(),
    Step5_PSU(),
    Step6_PSU(),
    Step7_PSU(),
    Step8_PSU(),
    Step9_PSU(),
    Step10_PSU(),
  ];
  var stepInfo = [];

  List getLessons() {
    for (var i = 0; i <stepListPageIndexes.length; i++) {
        StepCardInfo temp = StepCardInfo(
          title : stepsListTitlesAndSubTitles[i][0],
          subtitle: stepsListTitlesAndSubTitles[i][1]
        );
        stepInfo.add(temp);
      }
    return stepInfo;
  }

  @override
  Widget build(BuildContext context) {
    stepInfo = getLessons();

    ListTile makeListTile(StepCardInfo lesson, var listIndex) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.autorenew, color: Colors.white),
      ),
      title: Text(
        lesson.title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),


      subtitle: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(lesson.subtitle,
                    style: TextStyle(color: Colors.white))),
          )
        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => stepListPageIndexes[listIndex]));
      },
    );

    Card makeCard(StepCardInfo lesson, var listIndex) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: makeListTile(lesson, listIndex),
      ),
    );

    final Color logoColor = Color(0xff66c290);

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: stepInfo.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(stepInfo[index], index);
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("PC Build Guide"),
        backgroundColor: logoColor,
        elevation: 0.0,
      ),

      body: makeBody,

    );
  }




}