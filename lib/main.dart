import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_pc/models/users.dart';
import 'package:quick_pc/pages/authenticate/loginscreen.dart';
import 'package:quick_pc/pages/authenticate/registerscreen.dart';
import 'package:quick_pc/pages/home/home.dart';
import 'package:quick_pc/pages/home/home2.dart';
import 'package:quick_pc/pages/home/home3.dart';
import 'package:quick_pc/pages/part_info/part_info.dart';
import 'package:quick_pc/pages/search/pick_search.dart';
import 'package:quick_pc/pages/search/search.dart';
import 'package:quick_pc/pages/welcome.dart';
import 'package:quick_pc/pages/wrapper.dart';
import 'package:quick_pc/services/auth.dart';

import 'pages/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final bool firstTime = false;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(

      value: AuthService().user,
      child: MaterialApp(

        home: firstTime ? Welcome() : Wrapper(),
        //home: Wrapper(),

        routes: {
        '/welcome': (context) => Welcome(),
        '/loginscreen': (context) => LoginScreen(),
        '/registerscreen': (context) => RegisterScreen(),
        '/home': (context) => Home(),
        '/pick_search': (context) => PickSearch(),
        '/search': (context) => Search(),
        '/part_info': (context) => PartInfo(),
          '/home2': (context) => Home2(),
          '/home3': (context) => Home2(),
        },
      ),
    );
  }
}


