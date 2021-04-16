import 'package:flutter/material.dart';
import 'package:quick_pc/pages/welcome.dart';
import 'package:quick_pc/pages/loading.dart';
import 'package:quick_pc/pages/loginscreen.dart';
import 'package:quick_pc/pages/registerscreen.dart';
import 'package:quick_pc/pages/home.dart';
import 'package:quick_pc/pages/pick_search.dart';
import 'package:quick_pc/pages/search_list.dart';
import 'package:quick_pc/pages/part_info.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/welcome',
  routes: {
    '/': (context) => Loading(),
    '/welcome': (context) => Welcome(),
    '/loginscreen': (context) => LoginScreen(),
    '/registerscreen': (context) => RegisterScreen(),
    '/home': (context) => Home(),
    '/pick_search': (context) => PickSearch(),
    '/search_list': (context) => SearchList(),
    '/part_info': (context) => PartInfo(),
  }

));