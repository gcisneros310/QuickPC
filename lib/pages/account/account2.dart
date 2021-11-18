import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/pages/account/change_password.dart';
import 'package:quick_pc/pages/contact_us/contact_us.dart';
import 'package:quick_pc/pages/not_implemented/page_not_implemented.dart';
import 'package:quick_pc/pages/report_a_bug/report_a_bug.dart';
import 'package:quick_pc/pages/terms_of_service/terms_and_policy.dart';
import 'package:quick_pc/services/auth.dart';
import 'package:settings_ui/settings_ui.dart';

class Account2 extends StatefulWidget {
  @override
  _Account2State createState() => _Account2State();
}

class _Account2State extends State<Account2> {
  final Color logoColor = Color(0xff66c290);
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: logoColor,
        centerTitle: true,
        title: Text("Settings"),
        elevation: 0.0,

      ),
        body: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Container(
              child: SettingsList(
                sections: [
                  SettingsSection(
                    title: 'General',
                    tiles: [
                      SettingsTile(
                        title: 'Language',
                        subtitle: 'English',
                        leading: Icon(Icons.language),
                        onPressed: (BuildContext context) {},
                      ),
                    ],
                  ),
                  SettingsSection(
                    title: 'Account',
                    tiles: [
                      SettingsTile(
                        title: 'Change Password',
                        leading: Icon(Icons.lock),
                        onPressed: (BuildContext context) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChangePassword()),
                          );
                        },
                      ),
                      SettingsTile(
                        title: 'Delete Account',
                        leading: Icon(Icons.delete),
                        onPressed: (BuildContext context) {
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
                      ),
                      SettingsTile(
                        title: 'Logout',
                        leading: Icon(Icons.exit_to_app),
                        onPressed: (BuildContext context) async{
                          await _auth.signOut();
                        },
                      ),
                    ],
                  ),
                  SettingsSection(
                    title: 'Support',
                    tiles: [
                      SettingsTile(
                        title: 'Report a Bug',
                        leading: Icon(Icons.report),
                        onPressed: (BuildContext context) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ReportABug()),
                          );
                        },
                      ),
                      SettingsTile(
                        title: 'Send Feedback',
                        leading: Icon(Icons.feedback),
                        onPressed: (BuildContext context) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ContactUs()),
                          );
                        },
                      ),
                      SettingsTile(
                        title: 'Terms of Service',
                        leading: Icon(Icons.wysiwyg),
                        onPressed: (BuildContext context) {
                          showDialog(context: context, builder: (context){
                            return PrivacyPolicy(
                                mdFileName: 'terms_of_service.md'
                            );
                          },);
                        },
                      ),
                      SettingsTile(
                        title: 'Privacy Policy',
                        leading: Icon(Icons.privacy_tip),
                        onPressed: (BuildContext context) {
                          showDialog(context: context, builder: (context){
                            return PrivacyPolicy(
                                mdFileName: 'privacy_policy.md'
                            );
                          },);
                        },
                      ),




                    ],
                  ),
                ],
              )
          ),
        ),
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

  GestureDetector buildTermsOption(BuildContext context, String title){
    return GestureDetector(
      onTap:(){
        switch(title){
          case "Terms of Service": {
            showDialog(context: context, builder: (context){
              return PrivacyPolicy(
                  mdFileName: 'terms_of_service.md'
              );
            },);
          }
          break;
          case "Privacy Policy": {
            showDialog(context: context, builder: (context){
              return PrivacyPolicy(
                  mdFileName: 'privacy_policy.md'
              );
            },);
          }
          break;
          default: {
            print("Invalid choice");
          }
        }
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


