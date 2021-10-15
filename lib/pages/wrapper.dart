import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_pc/models/users.dart';
import 'package:quick_pc/pages/authenticate/authenticate.dart';
import 'package:quick_pc/pages/bottom_navigation/bottom_navigation_bar.dart';
import 'package:quick_pc/pages/home/home.dart';
import 'package:quick_pc/pages/home/home2.dart';

import 'authenticate/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // accessing user data from the provider
    final user = Provider.of<PCUser>(context);

    // return either Home or Authenticate widget
    if(user == null){
      return Authenticate();
    }
    else {
      return BottomNav();
    }

  }
}
