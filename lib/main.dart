import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'file:///C:/Users/Osman/AndroidStudioProjects/QuickPC/lib/pages/home/home.dart';
import 'package:quick_pc/pages/loading.dart';
import 'package:quick_pc/pages/loginscreen.dart';
import 'package:quick_pc/pages/pick_search.dart';
import 'package:quick_pc/pages/registerscreen.dart';
import 'package:quick_pc/pages/welcome.dart';
import 'package:quick_pc/pages/wrapper.dart';
import 'package:quick_pc/services/auth.dart';
import 'package:quick_pc/models/users.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        /*initialRoute: '/welcome',
        routes: {
        '/': (context) => Loading(),
        '/welcome': (context) => Welcome(),
        '/loginscreen': (context) => LoginScreen(),
        '/registerscreen': (context) => RegisterScreen(),
        '/home': (context) => Home(),
        '/pick_search': (context) => PickSearch(),
        }*/
        home: Wrapper(),
      ),
    );
  }
}


