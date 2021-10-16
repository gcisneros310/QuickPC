import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/PCPart.dart';
import 'package:quick_pc/services/realtimeDatabase.dart';

class PickSearch extends StatefulWidget {
  @override
  _PickSearchState createState() => _PickSearchState();
}

class _PickSearchState extends State<PickSearch> {

  final Color logoColor = Color(0xff66c290);
  final Color greyout = Colors.grey;

  Icon searchIcon = const Icon(Icons.search, color: Colors.white,
      size: 28);
  Widget searchText = const Text('Select Part or Type Here');
  Widget title = const Text('hello');
  String searchTerm = '';
  FocusNode myFocusNode;

  //List<Part> parts = [];
  //String partType = 'gpu';


/*  void updateList(){
    getPart('gpu').then((p) => {
      this.setState(() {
        *//*p.forEach((e) {
          print(e.name);
        });*//*
        //print(p);
        parts = p;
      })
    });

    print(parts.isEmpty);
  }*/


  @override
  void initState() {
    super.initState();
    print('initState function ran');
    myFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          backgroundColor: logoColor,


          title: TextField(
            autofocus: false,
            onChanged: (val) {
              setState(() => searchTerm = val);
            },
            decoration: InputDecoration(
              hintText: 'Select Part or Type Here...',
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
              border: InputBorder.none,
            ),
          ),
          elevation: 0,


          actions: [

            IconButton(
              onPressed: () {
                if (searchTerm != ""){
                  Navigator.pushNamed(
                    context, '/search', arguments: {'searchTerm': searchTerm},);
                }
              },
              icon: searchIcon,
            )
          ],
        ),
        body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            childAspectRatio: (2/1),
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: 2,
            children: <Widget>[

              //----------------------------------------------------------Buttons
              //CPU
              ElevatedButton.icon(
                  onPressed: (){
                    FocusScope.of(context).unfocus();
                    //Call the next page and pass a String of the part type
                    Navigator.pushNamed(
                      context, '/search', arguments: {
                      'partType': 'cpu'},);
                  },
                  icon: Icon(Icons.memory_sharp),
                  label: Text('CPU'),
                  style: ElevatedButton.styleFrom(
                      primary: logoColor
                  )
              ),

              //Memory
              ElevatedButton.icon(
                  onPressed: (){

                    FocusScope.of(context).unfocus();

                    Navigator.pushNamed(
                      context, '/search', arguments: {
                      'partType': 'memory'},);
                  },
                  icon: Icon(Icons.memory_sharp),
                  label: Text('Memory'),
                  style: ElevatedButton.styleFrom(
                      primary: greyout
                  )
              ),

              //STORAGE
              ElevatedButton.icon(
                  onPressed: (){
                    //Navigator.pushNamed(context, '/search');
                  },
                  icon: Icon(Icons.memory_sharp),
                  label: Text('Storage'),
                  style: ElevatedButton.styleFrom(
                      primary: greyout
                  )
              ),

              //MOTHERBOARD
              ElevatedButton.icon(
                  onPressed: (){
                    //Navigator.pushNamed(context, '/search');
                  },
                  icon: Icon(Icons.memory_sharp),
                  label: Text('Motherboard'),
                  style: ElevatedButton.styleFrom(
                      primary: greyout
                  )
              ),

              //GPU
              ElevatedButton.icon(
                  onPressed: (){

                    FocusScope.of(context).unfocus();

                    //Call the next page and pass a String of the part type
                    Navigator.pushNamed(
                      context, '/search', arguments: {
                      'partType': 'gpu'},);
                  },
                  icon: Icon(Icons.memory_sharp),
                  label: Text('GPU'),
                  style: ElevatedButton.styleFrom(
                      primary: logoColor
                  )
              ),

              //POWER SUPPLY
              ElevatedButton.icon(
                  onPressed: (){
                    //Navigator.pushNamed(context, '/search');
                  },
                  icon: Icon(Icons.memory_sharp),
                  label: Text('Power Supply'),
                  style: ElevatedButton.styleFrom(
                      primary: greyout
                  )
              ),

              //CASE
              ElevatedButton.icon(
                  onPressed: (){
                    //Navigator.pushNamed(context, '/search');
                  },
                  icon: Icon(Icons.memory_sharp),
                  label: Text('Case'),
                  style: ElevatedButton.styleFrom(
                      primary: greyout
                  )
              ),

              //CPU COOLER
              ElevatedButton.icon(
                  onPressed: (){
                    //Navigator.pushNamed(context, '/search');
                  },
                  icon: Icon(Icons.memory_sharp),
                  label: Text('CPU Cooler'),
                  style: ElevatedButton.styleFrom(
                      primary: greyout
                  )
              ),

            ]
        )
    );
  }
}