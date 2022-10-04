import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class ReportABug extends StatefulWidget {
  @override
  _ReportABugState createState() => _ReportABugState();
}

class _ReportABugState extends State<ReportABug> {
  Future sendEmail({
    String name = 'Test',
    String email = 'Test@hotmail.com',
    String message,
    String subject = 'Bug Report',
    String typeOfBug,

  }) async{
    final serviceId = 'service_qx49sc5';
    final templateId = 'template_r37t0rb';
    final userId = 'user_DP3DYb0iVEpMAzhXCTGsY';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id' : serviceId,
        'template_id' : templateId,
        'user_id' : userId,
        'template_params': {
          'user_name' : name,
          'user_email' : email,
          'user_subject' : subject,
          'user_message' : message,
          'bug_report' : typeOfBug,
        },
      }),
    );
    print(response.body);
  }

  String _chosenValue;
  final controllerMessage = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    Color logoColor = Color(0xff66C290);
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text("Report a Bug"),
        backgroundColor: logoColor,
        centerTitle: true
      ),
      body: ListView(
        shrinkWrap: true,
        reverse: true,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    Text(
                      'Report a Bug',
                      textAlign: TextAlign.center,
                      style:
                      GoogleFonts.exo2(color: Colors.white, fontSize: 28),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'If you encountered a bug, please fill out the form below.',
                      textAlign: TextAlign.center,
                      style:
                      GoogleFonts.exo2(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(height: 35),
                    DropdownButton<String>(
                      isExpanded: true,
                      value: _chosenValue,
                      dropdownColor: Colors.grey[850],
                      //elevation: 5,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      items: <String>[
                        'Login Page',
                        'Register Page',
                        'Home Page',
                        'Search Parts',
                        'Build Guide Page',
                        'Suggest PC Page',
                        'Account Page',
                        'Contact Us Page',
                        'About Us Page',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,

                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text(
                        "What page did the error occur?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          _chosenValue = value;
                        });
                      },
                    ),
                    TextFormField(
                      validator: (value) {
                        if(value.isEmpty)
                        {
                          return 'Enter a message';
                        }
                        else
                        {
                          return null;
                        }
                      },
                      controller: controllerMessage,
                      maxLines: 8,
                      decoration: InputDecoration(
                          hintText: "Describe how the bug was encountered.",
                          filled: true,
                          border: OutlineInputBorder(),
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
                                    TextButton(
                                      child: Text("Yes, send it"),
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.red,
                                      ),
                                      onPressed: () {
                                        print(_chosenValue);
                                        sendEmail(
                                            message: controllerMessage.text,
                                            typeOfBug: _chosenValue,
                                            );
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ]
                              );
                            }
                        );
                      },
                      color: logoColor,
                      child: Text('Send',
                          style: GoogleFonts.exo2(color: Colors.grey[850], fontSize: 16)),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              )
            ),

          ),
        ],
      ),

    );
  }
}