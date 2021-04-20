import 'package:flutter/material.dart';
import 'package:quick_pc/pages/authenticate/loginscreen.dart';
import 'package:quick_pc/pages/authenticate/registerscreen.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: LoginScreen(),
    );
  }
}
