import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_pc/models/users.dart';
import 'package:quick_pc/pages/authenticate/loginscreen.dart';
import 'package:quick_pc/pages/authenticate/registerscreen.dart';
import 'package:quick_pc/pages/home/home.dart';
import 'package:quick_pc/pages/home/home2.dart';
import 'package:quick_pc/pages/part_info/part_info.dart';
import 'package:quick_pc/pages/search/pick_search.dart';
import 'package:quick_pc/pages/search/search.dart';
import 'package:quick_pc/pages/search/select_search.dart';
import 'package:quick_pc/pages/welcome.dart';
import 'package:quick_pc/pages/wrapper.dart';
import 'package:quick_pc/services/auth.dart';

import 'pages/wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final bool firstTime = false;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<PCUser>.value(

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
          '/select_search': (context) => SelectSearch(),
          '/search': (context) => Search(),
          '/part_info': (context) => PartInfo(),
          '/home2': (context) => Home2(),


        },
      ),
    );
  }
}


