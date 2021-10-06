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
import 'package:quick_pc/presentation/app_icons_icons.dart';

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
    ['Step 7 (Optional)', 'Install any Optional Devices'],
    ['Step 8', 'Install Storage Devices'],
    ['Step 9', 'Review All Connections'],
    ['Step 10', 'Power on your Computer'],
  ];

  var stepListPageIndexes = [
    Step0_Page(),
    Step1_Page(),
    Step2_Page(),
    Step3_Page(),
    Step4_Page(),
    Step5_Page(),
    Step6_Page(),
    Step7_Page(),
    Step8_Page(),
    Step9_Page(),
    Step10_Page(),
  ];
  var stepInfo = [];

  var iconsList = [
  StepIcons.question_mark,
    StepIcons.power_supply,
    StepIcons.processor,
    StepIcons.ram,
    StepIcons.motherboard,
    StepIcons.cooler,
    StepIcons.gpu,
    StepIcons.gpu,
    StepIcons.slave_hard_drive,
    StepIcons.power_plug,
    StepIcons.power_button,
  ];

  List getStepTitles() {
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
    stepInfo = getStepTitles();

    ListTile makeListTile(StepCardInfo lesson, var listIndex) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(
            iconsList[listIndex],
            color: Colors.white,
          size: 48,
        ),
      ),
      title: Text(
        lesson.title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),


      subtitle: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
              child: Text(lesson.subtitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                  )
              )
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

    final makeBody = Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Container(
          // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: stepInfo.length,
            itemBuilder: (BuildContext context, int index) {
              return makeCard(stepInfo[index], index);
            },
          ),
        )
    );


    return Scaffold(
      backgroundColor: Colors.grey[700],
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