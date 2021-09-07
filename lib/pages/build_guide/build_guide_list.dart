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

class BuildGuideList extends StatefulWidget {
  @override
  _BuildGuideList createState() => _BuildGuideList();
}


class _BuildGuideList extends State<BuildGuideList> {
  var stepsListTitles = ["Step 0: Assemble your Parts",
    "Step 1: Install your Power Supply",
    "Step 2: Install the CPU",
    "Step 3: Install the RAM",
    "Step 4: Install the Motherboard",
    "Step 5: Install the CPU Cooler/Heatsink",
    "Step 6: Install the Graphics Card",
    "Step 7: (Optional) Install any Optional Devices",
    "Step 8: Install Storage Devices",
    "Step 9: Review All Connections",
    "Step 10: Power on your Computer!"

  ];

  var stepListPageIndexes = [
    ["Step 0: Assemble your Parts", Step0_PSU()],
    ["Step 1: Assemble your Parts", Step1_PSU()],
    ["Step 2: Assemble your Parts", Step2_PSU()],
    ["Step 3: Assemble your Parts", Step3_PSU()],
    ["Step 4: Assemble your Parts", Step4_PSU()],
    ["Step 5: Assemble your Parts", Step5_PSU()],
    ["Step 6: Assemble your Parts", Step6_PSU()],
    ["Step 7: Assemble your Parts", Step7_PSU()],
    ["Step 8: Assemble your Parts", Step8_PSU()],
    ["Step 9: Assemble your Parts", Step9_PSU()],
    ["Step 10: Assemble your Parts", Step10_PSU()],
  ];
  @override
  Widget build(BuildContext context) {
    final Color logoColor = Color(0xff66c290);

    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("PC Build Guide"),
        backgroundColor: logoColor,
        elevation: 0.0,
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        margin: EdgeInsets.all(8.0),
        child: Column(
            children: <Widget> [
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                child: Text(
                    "Below are each step in order for how to build your PC one step at a time!\n\n"
                        "Feel free to go back and forth in case you need to review how to follow a specific step.",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    )
                ),
              ),
              Expanded(
                child: ListView.builder(
                      itemCount: stepsListTitles.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10)
                            ),
                            side: BorderSide(width: 5, color: logoColor)
                          ),
                          child:ListTile(
                            tileColor: Colors.greenAccent,
                            onTap : (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => stepListPageIndexes[index][1])
                              );
                            },
                            title: (Text(stepsListTitles[index])),
                          )

                        );
                      }
                  )
              )

            ]
        )
      )

    );
  }




}