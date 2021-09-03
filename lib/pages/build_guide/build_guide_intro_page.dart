import 'package:flutter/material.dart';
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
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: logoColor,
        centerTitle: true,
        title: Text("PC Build Guide"),
        elevation: 0.0,
      ),
      body: Container (
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(
                "Welcome to the PC Build Guide!\n\nNow that you have gathered all of "
                    "your PC components, it is time to build it together!\n\n"
                    "Building a PC might be daunting, but rest assured it is easier "
                    "than expected, and this guide will help you through each individual step.\n\n"
                    "This guide will include both text and visual descriptors for how to build your computer."
                    ,
                style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: Colors.white
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                  child: Image(
                      image: AssetImage('assets/buildguideintropc.png')
                  )
              )

            ],
          )
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

    );
  }
}