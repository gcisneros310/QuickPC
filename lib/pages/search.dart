import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quick_pc/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_pc/pages/parts_list.dart';
import 'package:quick_pc/models/cpu.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  final Color logoColor = Color(0xff66c290);

  //temp
  List listOfParts = List<String>.generate(10000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CPU>>.value(
      value: DatabaseService().cpus,
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: Scaffold(

            backgroundColor: Colors.grey[850],

            appBar: AppBar(
              backgroundColor: logoColor,

              bottom: TabBar(
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.white,
                tabs: [
                  Tab(text: 'List',
                      icon: Icon(Icons.list)),
                  Tab(text: 'Filter',
                      icon: Icon(Icons.filter_alt)),
                  Tab(text: 'compare',
                      icon: Icon(Icons.compare_arrows)),
                ],
              ),
              title: Text('Search List: '),
            ),
            body: TabBarView(
              children: [

                //Search list Tab Contents
                PartsList(),

                //Filter Tab Contents
                Icon(Icons.filter_alt),

                //Compare Tab Contents
                //Icon(Icons.compare_arrows),
                Icon(Icons.compare_arrows),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
