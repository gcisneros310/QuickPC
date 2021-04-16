import 'package:flutter/material.dart';
class SearchList extends StatefulWidget {
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {

  final Color logoColor = Color(0xff66c290);

  //temp
  List listOfParts = List<String>.generate(10000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ListView.builder(
                itemCount: listOfParts.length,
                itemBuilder: (context, index) {
                  return Card(

                    child: ListTile(
                      title: Text('${listOfParts[index]}'),
                      onTap: (){
                        Navigator.pushNamed(context, '/part_info');
                      },
                    )
                  );
                },
              ),

              //Filter Tab Contents
              Icon(Icons.filter_alt),

              //Compar Tab Contents
              Icon(Icons.compare_arrows),
            ],
          ),
        ),
      ),
    );
  }
}
