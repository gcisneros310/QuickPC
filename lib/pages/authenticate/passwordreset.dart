import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/pages/authenticate/registerscreen.dart';
import 'package:quick_pc/pages/home/home.dart';
import 'package:quick_pc/services/auth.dart';
import 'package:quick_pc/shared/loading.dart';

class PasswordReset extends StatefulWidget {

  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final AuthService _auth  = AuthService();

  // key used to identify form
  final _formkey = GlobalKey<FormState>();

  // loading icon
  bool loading = false;

  final Color logoColor = Color(0xff66C290);

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  String email  = "";
  String password =  "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading ?  Loading() : Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.grey[850],
        body: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Form (
              key: _formkey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Reset Your Password',
                      textAlign: TextAlign.center,
                      style:
                      GoogleFonts.exo2(color: Colors.white, fontSize: 28),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Enter your email to get a password reset link',
                      textAlign: TextAlign.center,
                      style:
                      GoogleFonts.exo2(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(height: 50,),
                    _buildTextFieldEmail(nameController, Icons.account_circle, 'Email'),
                    //Login Button
                    SizedBox(height: 30),
                    MaterialButton(
                      elevation: 0,
                      minWidth: double.maxFinite,
                      height: 50,
                      onPressed: () async{
                        await _auth.resetPass(email);
                        Navigator.of(context).pop();
                      },
                      color: logoColor,
                      child: Text('Reset Password',
                          style: GoogleFonts.exo2(color: Colors.white, fontSize: 16)),
                      textColor: Colors.white,
                    ),
                    SizedBox(height: 20),
                    Text (
                        error,
                        style: GoogleFonts.exo2(color: Colors.red[600], fontSize: 16)
                    ),
                  ],
                ),
              ),
            )
        ));
  }


  _buildTextFieldEmail(
      TextEditingController controller, IconData icon, String labelText) {
    bool _secureText = true;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: logoColor, border: Border.all(color: Colors.blue)),
      child: TextFormField(
        validator: (val) => val.isEmpty ? 'Enter an email' : null,
        onChanged: (val) {
          setState(() => email = val);
        },
        controller: controller,
        style: GoogleFonts.exo2(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: GoogleFonts.exo2(color: Colors.white),
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
}