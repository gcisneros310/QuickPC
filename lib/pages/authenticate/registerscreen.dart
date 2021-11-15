import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/pages/terms_of_service/terms_and_policy.dart';
import 'package:quick_pc/services/auth.dart';
import 'package:quick_pc/shared/loading.dart';
import 'package:quick_pc/services/passwordvalidator.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final Color logoColor = Color(0xff66C290);

  final AuthService _auth  = AuthService();

  PasswordValidator passVal = PasswordValidator();

  // key used to identify form
  final _formkey = GlobalKey<FormState>();

  bool loading = false;

  final TextEditingController emailController = TextEditingController();
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
                    'Register a QuickPC account',
                    textAlign: TextAlign.center,
                    style:
                    GoogleFonts.exo2(color: Colors.white, fontSize: 28),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Enter your email and a password that contains: '
                        'An uppercase letter, a lowercase letter, a number'
                        ' and is 8 characters or more'
                        ' to register an account',
                    textAlign: TextAlign.center,
                    style:
                    GoogleFonts.exo2(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  _buildNameEmailField(emailController, Icons.email, 'Email'),
                  SizedBox(height: 20),
                  _buildPassField(passwordController, Icons.lock, 'Password'),
                  SizedBox(height: 40),
                  MaterialButton(
                    elevation: 0,
                    minWidth: double.maxFinite,
                    height: 50,
                    onPressed: () async{
                      // evaluates true or false for registering
                      if(_formkey.currentState.validate()){
                        setState(() => loading = true);
                        dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                        if(result == null){
                          setState(() {
                            error = 'Please supply a valid email';
                            loading = false;
                          });
                        }
                        else {
                          setState(() {
                            Navigator.pop(context);
                            loading = false;
                          });
                        }
                      }
                      print(loading);
                    },
                    color: logoColor,
                    child: Text('Register',
                        style: GoogleFonts.exo2(color: Colors.white, fontSize: 16)),
                    textColor: Colors.white,
                  ),
                  SizedBox(height:60),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "By creating an account, you are agreeing to our \n",
                      style: GoogleFonts.exo2(color: Colors.white, fontSize: 16),
                      children: [
                        TextSpan(
                          text: "Terms of Service",
                          style: GoogleFonts.exo2(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap =(){
                            showDialog(context: context, builder: (context){
                              return PrivacyPolicy(
                                  mdFileName: 'terms_of_service.md'
                              );
                            },);
                          },
                        ),
                        TextSpan(
                          text: " and ",
                          style: GoogleFonts.exo2(color: Colors.white, fontSize: 16),
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          style: GoogleFonts.exo2(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap =(){
                            showDialog(context: context, builder: (context){
                              return PrivacyPolicy(
                                  mdFileName: 'privacy_policy.md'
                              );
                            },);
                          },
                        ),
                      ],
                    ),
                  ),
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

  _buildPassField(
      TextEditingController controller, IconData icon, String labelText) {
    bool _secureText = true;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: logoColor, border: Border.all(color: Colors.blue)),
      child: TextFormField(
        validator: (val) => !passVal.validateStructure(val) ? 'Enter a password 8 characters or more' : null,
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

  _buildNameEmailField(
      TextEditingController controller, IconData icon, String labelText) {
    bool _secureText = true;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: logoColor, border: Border.all(color: Colors.blue)),
      child: TextFormField(
        validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
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