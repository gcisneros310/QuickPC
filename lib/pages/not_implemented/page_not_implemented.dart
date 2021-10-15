import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/pages/home/home.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pc/pages/report_a_bug/report_a_bug.dart';

class PageNotImplemented extends StatefulWidget {
  @override
  _PageNotImplemented createState() => _PageNotImplemented();
}



class _PageNotImplemented extends State<PageNotImplemented> {
  final Color logoColor = Color(0xff66c290);
  final Color greyout = Colors.grey;
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerMessage = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text("Page Not Implemented"),
        titleTextStyle: GoogleFonts.exo2(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        backgroundColor: logoColor,
        centerTitle: true,
        // title: Text("Contact Us"),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
            child: Form(
                key: _formKey,
                child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Page is not yet implemented. Try again later!',
                        style:
                        GoogleFonts.exo2(color: Colors.white, fontSize: 45),
                      ),
                    ]
                ))
        ),
      ),
    );
  }


}