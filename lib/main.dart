import 'package:flutter/material.dart';
import 'package:quick_pc/pages/home.dart';
import 'package:quick_pc/pages/loading.dart';
import 'package:quick_pc/pages/pick_search.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/pick_search': (context) => PickSearch(),
  }

));