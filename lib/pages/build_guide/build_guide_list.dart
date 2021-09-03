import 'package:flutter/material.dart';
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
                            onTap : (){},
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