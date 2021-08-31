import 'package:flutter/material.dart';
import 'package:quick_pc/services/auth.dart';

class BuildGuide extends StatefulWidget {
  @override
  _BuildGuide createState() => _BuildGuide();
}

class _BuildGuide extends State<BuildGuide> {


  final Color logoColor = Color(0xff66c290);
  final Color greyout = Colors.grey;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          backgroundColor: logoColor,
          title: Text("PC Build Guide"),
          elevation: 0.0,
        ),
      body: Center (
        child: Text(
          "Welcome to the PC Build Guide!\nNow that you have gathered all of"
              "your PC components, it is time to build it together!\n"
              "Building a PC might be daunting, but rest assured it is easier"
              "than expected, and this guide will help you through each individual step."
        )
      ),

    );
  }
}