import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/PCPart.dart';
import 'package:provider/provider.dart';
import 'package:quick_pc/pages/search/parts_list.dart';
import 'package:quick_pc/services/database.dart';
import 'package:quick_pc/services/realtimeDatabase.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {



  final Color logoColor = Color(0xff66c290);

  Icon searchIcon = const Icon(Icons.search, color: Colors.white,
      size: 28);

  String searchTerm;
  //List<Part> parts = [];
  String partType = '';

  @override
  Widget build(BuildContext context) {

    //Getting arguments
    final arguments = ModalRoute.of(context).settings.arguments as Map;

    if (arguments != null){
      searchTerm = arguments['searchTerm'];
      partType = arguments['partType'];
      //parts = arguments['partsList'];
    }

    DatabaseService().doSearch(searchTerm);



    //return FutureProvider<List<Part>>.value(
    //value: DatabaseService(searchTerm: searchTerm).cpus,

    return FutureProvider<List<Part>>.value(
        value: getPart(partType),
        child: Scaffold(
          body: DefaultTabController(
            length: 3,
            child: Scaffold(

              backgroundColor: Colors.grey[850],

              appBar: AppBar(
                backgroundColor: logoColor,

                title: TextField(
                  autofocus: false,
                  onChanged: (val) {
                    setState(() => searchTerm = val);
                  },
                  decoration: InputDecoration(
                    hintText: 'Filter search list by text...',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                    border: InputBorder.none,
                  ),
                ),

                actions: [

                  IconButton(
                    onPressed: () {

                    },
                    icon: searchIcon,
                  )
                ],

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

              ),
              body: TabBarView(
                children: [

                  //Search list Tab Contents
                  PartsList(partType),

                  //Filter Tab Contents
                  Icon(Icons.filter_alt),

                  //Compare Tab Contents
                  //Icon(Icons.compare_arrows),
                  Icon(Icons.compare_arrows),
                ],
              ),
            ),
          ),
        )
    );
  }
}
