import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pc/pages/report_a_bug/report_a_bug.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUs createState() => _ContactUs();
}

class CustomDialog extends StatelessWidget{
  final String title, description, buttonText;
  final Image image;
  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 100, bottom: 16, left: 16, right: 16),
            margin: EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0)
                  )
                ]
            ),
            child: Column(
              //mainAxisAlignment: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    style: GoogleFonts.exo2(color: Colors.white, fontSize: 28),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    description,
                    style: GoogleFonts.exo2(color: Colors.white, fontSize: 28),
                  ),
                  SizedBox(height: 24.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Confirm"),
                    ),
                  )
                ]

            )

        ),
      ],
    );
  }

  CustomDialog({this.title, this.description, this.buttonText, this.image});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation:0,
      backgroundColor:Colors.transparent,
      child: dialogContent(context),
    );
  }





}

class _ContactUs extends State<ContactUs> {
  final Color logoColor = Color(0xff66c290);
  final Color greyout = Colors.grey;
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerMessage = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  Future sendEmail({
    String name,
    String email,
    String message,
    String subject = 'Customer Inquiry',
  }) async{
    final serviceId = 'service_qx49sc5';
    final templateId = 'template_99dhy7g';
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
        },
      }),
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text("Contact Us"),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Contact Us',
                        textAlign: TextAlign.center,
                        style:
                        GoogleFonts.exo2(color: Colors.white, fontSize: 28),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Feel like contacting us? Submit your questions and we will get back to you as soon as possible.',
                        textAlign: TextAlign.center,
                        style:
                        GoogleFonts.exo2(color: Colors.white, fontSize: 14),
                      ),
                      SizedBox(height: 35),
                      TextFormField(
                        validator: (value) {
                          if(value.isEmpty)
                          {
                            return 'Enter a name';
                          }
                          else
                          {
                            return null;
                          }
                        },
                        controller: controllerName,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            hintText: "Name",
                            filled: true,
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.account_circle_rounded, color: Colors.white),
                            fillColor: logoColor),
                        style: GoogleFonts.exo2(color: Colors.white, fontSize: 16),

                      ),

                      SizedBox(height: 15),
                      TextFormField(
                        validator: (value) {
                          if(value.isEmpty)
                          {
                            return 'Enter a valid email';
                          }
                          else
                          {
                            return null;
                          }
                        },
                        controller: controllerEmail,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            hintText: "Email",
                            filled: true,
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email, color: Colors.white),
                            fillColor: logoColor),
                        style: GoogleFonts.exo2(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 15),
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
                        maxLines: 5,
                        decoration: InputDecoration(
                            hintText: "Enter a message",
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
                                          sendEmail( name: controllerName.text,
                                              email: controllerEmail.text,
                                              message: controllerMessage.text);
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




                    ]
                ))
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReportABug())
          );
        },
        icon: Icon(Icons.arrow_forward),
        label: const Text("Report Bug"),
        backgroundColor: logoColor,
      ),
    );
  }


}