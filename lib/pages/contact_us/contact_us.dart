import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ContactUs extends StatefulWidget {
  @override
  _ContactUs createState() => _ContactUs();
}


class _ContactUs extends State<ContactUs> {
  final Color logoColor = Color(0xff66c290);
  final Color greyout = Colors.grey;
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerMessage = TextEditingController();

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
        backgroundColor: logoColor,
        centerTitle: true,
       // title: Text("Contact Us"),
        elevation: 0.0,
      ),
     body: Padding(
       padding: const EdgeInsets.all(30.0),
       child: Container(
           child: Form(child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text(
                   'Contact Us',
                   textAlign: TextAlign.center,
                   style:
                   GoogleFonts.exo2(color: Colors.white, fontSize: 28),
                 ),
                 SizedBox(height: 35),
                 TextField(
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
                 TextField(
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
                 TextField(
                   controller: controllerMessage,
                   maxLines: 5,
                   decoration: InputDecoration(
                       hintText: "Enter a message",
                       filled: true,
                       border: OutlineInputBorder(),
                       fillColor: logoColor),
                   style: GoogleFonts.exo2(color: Colors.white, fontSize: 16),
                 ),
                 TextButton(onPressed: () {

                  print(controllerName.text);
                  print(controllerEmail.text);
                  print(controllerMessage.text);
                  sendEmail( name: controllerName.text,
                             email: controllerEmail.text,
                             message: controllerMessage.text);
                 },
                     child: Text('Send')),

               ]
           ))
       ),
     ),
    );
  }


}