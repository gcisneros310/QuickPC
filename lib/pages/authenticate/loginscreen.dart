import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/pages/authenticate/passwordreset.dart';
import 'package:quick_pc/pages/authenticate/registerscreen.dart';
import 'package:quick_pc/pages/home/home.dart';
import 'package:quick_pc/pages/terms_of_service/terms_and_policy.dart';
import 'package:quick_pc/services/auth.dart';
import 'package:quick_pc/shared/loading.dart';

import 'my_password.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    'Sign in to your QuickPC account',
                    textAlign: TextAlign.center,
                    style:
                    GoogleFonts.exo2(color: Colors.white, fontSize: 28),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Enter your account information below to gain access to the features of QuickPC',
                    textAlign: TextAlign.center,
                    style:
                    GoogleFonts.exo2(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(height: 50,),
                  _buildTextFieldEmail(nameController, Icons.account_circle, 'Email'),
                  SizedBox(height: 20),
                  _buildTextFieldPassword(passwordController, Icons.lock, 'Password'),

                  //Login Button
                  SizedBox(height: 30),
                  MaterialButton(
                    elevation: 0,
                    minWidth: double.maxFinite,
                    height: 50,
                    onPressed: () async{
                      if(_formkey.currentState.validate()){
                        setState(() => loading = true);
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                       if(result == null){
                        setState(() {
                          error = 'Could not Sign In With Those Credentials';
                          loading = false;
                        });
                        }
                        //Navigator.push(context,
                            //MaterialPageRoute(builder: (_) => Home()));
                      }
                      CurrentPassword.setPassword(password);
                      print(loading);
                    },
                    color: logoColor,
                    child: Text('Login',
                        style: GoogleFonts.exo2(color: Colors.white, fontSize: 16)),
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 20),
                  Text (
                      error,
                      style: GoogleFonts.exo2(color: Colors.red[600], fontSize: 16)
                  ),
                  SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "Don't have an Account ? ",
                            style: GoogleFonts.exo2(color: Colors.white, fontSize: 16)
                        ),
                        GestureDetector(
                            onTap: () {Navigator.push(context,
                                MaterialPageRoute(builder: (_) => RegisterScreen()));},
                            child: Text(
                                "Sign Up",
                                style: GoogleFonts.exo2(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)
                            )
                        )
                      ]
                  ),
                  SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {Navigator.push(context,
                                MaterialPageRoute(builder: (_) => PasswordReset()));},
                            child: Text(
                                "Forgot Password ? ",
                                style: GoogleFonts.exo2(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)
                            )
                        )
                      ]
                  ),
                ],
              ),
            ),
          )
        ));
  }

  _buildTextFieldPassword(
      TextEditingController controller, IconData icon, String labelText) {
    bool _secureText = true;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: logoColor, border: Border.all(color: Colors.blue)),
      child: TextFormField(
        validator: (val) => val.length < 6 ? 'Enter a password 6 characters or more' : null,
        onChanged: (val) {
          setState(() => password = val);
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
        obscureText: _secureText,
      ),
    );
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