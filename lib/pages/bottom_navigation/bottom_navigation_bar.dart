import 'package:flutter/material.dart';
import 'package:quick_pc/pages/account/account.dart';
import 'package:quick_pc/pages/build_list/SavedListsPage.dart';
import 'package:quick_pc/pages/home/home2.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  // Bottom Navigation Bar
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Home2(),
    SavedListsPage(),
    Account(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt((_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem( //Index 0
              icon: Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem( //Index 1
              icon: Icon(Icons.build),
              label: "Your Builds"
          ),
          BottomNavigationBarItem( //Index 2
              icon: Icon(Icons.account_circle_rounded),
              label: "Account"
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
