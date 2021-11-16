import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/pages/account/change_password.dart';
import 'package:quick_pc/pages/authenticate/loginscreen.dart';
import 'package:quick_pc/pages/authenticate/registerscreen.dart';
import 'package:quick_pc/pages/contact_us/contact_us.dart';
import 'package:quick_pc/pages/home/home.dart';
import 'package:quick_pc/pages/not_implemented/page_not_implemented.dart';
import 'package:quick_pc/pages/report_a_bug/report_a_bug.dart';
import 'package:quick_pc/services/auth.dart';
import 'package:shared_preferences_settings/shared_preferences_settings.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final Color logoColor = Color(0xff66c290);
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: logoColor,
        centerTitle: true,
        title: Text("Settings"),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                SizedBox(height: 40),
                Row(
                  children: [
                   // Icon(Icons.person, color: Colors.blueAccent),
                    SizedBox(width: 10),
                    Text("GENERAL", style: GoogleFonts.exo2(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold))
                  ],
                ),
                Divider(height: 20, thickness:1),
                SizedBox(height:10),
                buildPasswordOption((context), "Change Password"),
                buildLogoutOption((context), "Logout"),
                buildDeleteOption((context), "Delete Account"),
                SizedBox(height: 40),
                Row(
                  children: [
                    // Icon(Icons.person, color: Colors.blueAccent),
                    SizedBox(width: 10),
                    Text("Feedback", style: GoogleFonts.exo2(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold))
                  ],
                ),
                Divider(height: 20, thickness:1),
                SizedBox(height:10),
                buildReportOption((context), "Report a Bug"),
                buildFeedbackOption((context), "Send Feedback"),
                buildToSOption((context), "Terms of Service"),

              ],
      )
      )
    );
  }

  GestureDetector buildPasswordOption(BuildContext context, String title){
    return GestureDetector(
      onTap:(){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChangePassword()),
        );
      },
      child:Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: GoogleFonts.exo2(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ],
          )

      ),
    );
  }

  GestureDetector buildToSOption(BuildContext context, String title){
    return GestureDetector(
      onTap:(){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageNotImplemented()),
        );
      },
      child:Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: GoogleFonts.exo2(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ],
          )

      ),
    );
  }

  GestureDetector buildReportOption(BuildContext context, String title){
    return GestureDetector(
      onTap:(){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReportABug()),
        );
      },
      child:Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: GoogleFonts.exo2(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ],
          )

      ),
    );
  }

  GestureDetector buildDeleteOption(BuildContext context, String title){
    return GestureDetector(
      onTap:(){
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                titleTextStyle: GoogleFonts.exo2(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                title: Text("Delete the Account?"),
                content: Text("You will not be able to recover it"),
                actions: <Widget>[
                  TextButton(
                    child: Text("Cancel"),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text("Yes, delete it"),
                    textColor: Colors.red,
                    onPressed: () async{
                      Navigator.pop(context);
                      await _auth.deleteAccount();
                      await _auth.signOut();
                      Navigator.pop(context);
                      print("Popping");
                      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
                    },
                  ),
                ]
              );
            }
          );
      },
      child:Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: GoogleFonts.exo2(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ],
          )
      ),
    );
  }

  GestureDetector buildFeedbackOption(BuildContext context, String title){
    return GestureDetector(
      onTap:(){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ContactUs()),
        );

      },
      child:Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: GoogleFonts.exo2(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold)),
            Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        )

      ),
    );
  }
  GestureDetector buildLogoutOption(BuildContext context, String title){
    return GestureDetector(
      onTap:() async{
          await _auth.signOut();
          //Navigator.pop(context);
          },

      child:Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: GoogleFonts.exo2(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ],
          )
      ),
    );
  }


}


