import 'package:flutter/material.dart';
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
      //searchTerm = arguments['searchTerm'];
      partType = arguments['partType'];
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

                title: Container(
                  width: 250,
                  child: TextFormField(
                    onChanged: (val) {
                      setState(() => searchTerm = val);
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Filter by Name...',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFFAFAFA),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFFAFAFA),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                    ),

                    textAlign: TextAlign.start,
                  ),
                ),

                actions: [

                  IconButton(
                    onPressed: () {

                      //list = fil.filterByName(list, searchTerm);

                      list.searchByName = true;
                      list.name = searchTerm;



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
                  list = SearchList(partType, fil, compareList),



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
                              //DefaultTabController.of(context).animateTo(1);

                            },
                            label: const Text('Apply'),
                            backgroundColor: logoColor,
                          )
                        ]
                    )


                  ),


                  //Compare Tab Contents
                  CompareUI(compareList: compareList),
                ],
              ),
            ),
          ),
        )
    );
  }
}
