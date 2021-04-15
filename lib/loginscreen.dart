import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/reigsterscreen.dart';

class LoginScreen extends StatelessWidget {
  final Color logoColor = Color(0xff66C290);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.grey[850],
        body: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Register or Sign in to your QuickPC account',
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
                _buildTextField(nameController, Icons.account_circle, 'Username'),
                SizedBox(height: 20),
                _buildTextField(passwordController, Icons.lock, 'Password'),

                SizedBox(height: 30),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => RegisterScreen()));
                  },
                  color: logoColor,
                  child: Text('Login',
                      style: GoogleFonts.exo2(color: Colors.white, fontSize: 16)),
                  textColor: Colors.white,
                ),
                SizedBox(height: 20),
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
               )
              ],
            ),
          ),
        ));
  }

  _buildTextField(
      TextEditingController controller, IconData icon, String labelText) {
    bool _secureText = true;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: logoColor, border: Border.all(color: Colors.blue)),
      child: TextField(
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
}
