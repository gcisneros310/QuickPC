import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/CompletePCBuild.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';
import 'package:provider/provider.dart';
import 'package:quick_pc/pages/search/compare/compareUI.dart';
import 'package:quick_pc/pages/search/filters/filterUI.dart';
import 'package:quick_pc/pages/search/search_list.dart';
import 'package:quick_pc/services/database.dart';
import 'package:quick_pc/services/realtimeDatabase.dart';
import 'package:quick_pc/pages/search/filters/part_filter.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {



  final Color logoColor = Color(0xff66c290);

  Icon searchIcon = const Icon(Icons.search, color: Colors.white,
      size: 28);
  CompletePCBuild buildObject;
  String searchTerm;
  String partType = "";
  bool clearFilter = true;
  Filter fil;
  FilterUI filUI;

  SearchList list;

  List<Part> compareList;


  @override
  Widget build(BuildContext context) {

    //Getting arguments
    final arguments = ModalRoute.of(context).settings.arguments as Map;


    if (arguments != null){
      searchTerm = arguments['searchTerm'];
      partType = arguments['partType'];
      buildObject = arguments['buildObject'];
    }

    fil = Filter(partType);
    filUI = FilterUI(fil);

    compareList = [];

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
                      //print(compareList);
                      String j = "2 x 8GB";
                      String k = "2 x 16GB";

                      print(k.substring(0,1));
                      print(k.substring(4));

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
                  list = SearchList(partType, fil, compareList, buildObject),



                  //Filter Tab Contents

                  Scaffold(

                    body: filUI,
                    
                    floatingActionButton: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton.extended(
                            onPressed: (){
                              list.clearFilter = true;
                              fil = new Filter(partType);
                              },
                            label: const Text('Clear'),
                            backgroundColor: logoColor,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FloatingActionButton.extended(
                            onPressed: (){
                              list.clearFilter = false;
                              },
                            label: const Text('Apply'),
                            backgroundColor: logoColor,
                          )
                        ]
                    )




                  ),


                  //Compare Tab Contents
                  //Icon(Icons.compare_arrows),
                  CompareUI(compareList: compareList),
                ],
              ),
            ),
          ),
        )
    );
  }
}
