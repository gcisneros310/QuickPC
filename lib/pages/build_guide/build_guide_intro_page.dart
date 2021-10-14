import 'package:flutter/material.dart';
import 'package:quick_pc/pages/universal_drawer/NavigationDrawer.dart';
import 'package:quick_pc/services/auth.dart';

import 'build_guide_list.dart';

class BuildGuideIntro extends StatefulWidget {
  @override
  _BuildGuideIntro createState() => _BuildGuideIntro();
}

class _BuildGuideIntro extends State<BuildGuideIntro> {
  final Color logoColor = Color(0xff66c290);
  final Color greyout = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      backgroundColor: Colors.grey[850],
      appBar: AppBar(

        backgroundColor: logoColor,
        centerTitle: true,
        title: Text("PC Build Guide"),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container (
            padding: EdgeInsets.fromLTRB(16,16,16,16),
            margin: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Welcome to the PC Build Guide!\n\n"
                      "Now that you have gathered all of "
                      "your PC components, it is time to build it together!\n\n"
                      "Building a PC might be daunting, but rest assured it is easier "
                      "than expected, and this guide will help you through each individual step.\n\n"
                      "This guide will include a variety of both visual and descriptive guides for most steps of the building process\n\n"
                      "This guide will list out 10 major steps. If you ever get lost or stuck, feel free to go back and forth between steps!.",
                  style: TextStyle(
                      fontSize: 14.5,
                      letterSpacing: 2.0,
                      color: Colors.white
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(15,15,15,15),
                    child: Image(
                        image: AssetImage('assets/images/Avant-Tower-Gaming-PC.png')
                    )
                )
              ],
            )
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BuildGuideList())
          );
        },
        icon: Icon(Icons.arrow_forward),
        label: const Text("Go to Guide"),
        backgroundColor: logoColor,
      ),
      drawer: SafeArea(child: NavigationDrawer()),
      drawerEnableOpenDragGesture: true,

    );
  }
}