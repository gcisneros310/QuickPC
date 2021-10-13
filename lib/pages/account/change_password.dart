import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/pages/authenticate/loginscreen.dart';
import 'package:quick_pc/pages/authenticate/registerscreen.dart';
import 'package:quick_pc/pages/contact_us/contact_us.dart';
import 'package:quick_pc/pages/home/home.dart';
import 'package:quick_pc/pages/report_a_bug/report_a_bug.dart';
import 'package:quick_pc/services/auth.dart';
import 'package:shared_preferences_settings/shared_preferences_settings.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final Color logoColor = Color(0xff66c290);
  final AuthService _auth = AuthService();
  final controllerPassword = TextEditingController();
  final controllerCPassword = TextEditingController();
  final controllerMessage = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text("Reset Password"),
        titleTextStyle: GoogleFonts.exo2(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        backgroundColor: logoColor,
        centerTitle: true,
        // title: Text("Contact Us"),
        elevation: 0.0,
      ),
      body: ListView(
        shrinkWrap: true,
        reverse: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right:30),
            child: Container(
                child: Form(
                    key: _formKey,
                    child: Column(
                       // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 100),
                          Text(
                            'Reset Password',
                            textAlign: TextAlign.center,
                            style:
                            GoogleFonts.exo2(color: Colors.white, fontSize: 28),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Your new password must be different from previous used passwords',
                            textAlign: TextAlign.center,
                            style:
                            GoogleFonts.exo2(color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(height: 35),
                          TextFormField(
                            validator: (value) {
                              if(value.isEmpty)
                              {
                                return 'Enter your current password';
                              }
                              else
                              {
                                return null;
                              }
                            },
                            controller: controllerPassword,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                hintText: "Current Password",
                                filled: true,
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock, color: Colors.white),
                                fillColor: logoColor),
                            style: GoogleFonts.exo2(color: Colors.white, fontSize: 16),

                          ),

                          SizedBox(height: 15),
                          TextFormField(
                            validator: (value) {
                              if(value.isEmpty)
                              {
                                return 'Enter a new password';
                              }
                              else
                              {
                                return null;
                              }
                            },
                            controller: controllerCPassword,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                hintText: "Confirm Password",
                                filled: true,
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock, color: Colors.white),
                                fillColor: logoColor),
                            style: GoogleFonts.exo2(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(height: 15),
                          MaterialButton(
                            elevation: 0,
                            minWidth: double.maxFinite,
                            height: 50,
                            onPressed: () {
                              if(!_formKey.currentState.validate())
                              {
                                return null;
                              }
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        titleTextStyle: GoogleFonts.exo2(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                        title: Text("Send the Message?"),
                                        content: Text("You will not be able to recover it"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("Cancel"),
                                            onPressed: (){
                                              Navigator.pop(context);
                                            },
                                          ),
                                          FlatButton(
                                            child: Text("Yes, send it"),
                                            textColor: Colors.red,
                                            onPressed: () {
                                            },
                                          ),
                                        ]
                                    );
                                  }
                              );
                            },
                            color: logoColor,
                            child: Text('Reset Password',
                                style: GoogleFonts.exo2(color: Colors.grey[850], fontSize: 16)),
                            textColor: Colors.white,
                          ),
                        ]
                    ))
            ),
          ),
        ],
      ),
    );
  }
}


