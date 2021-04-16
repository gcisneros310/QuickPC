import 'package:flutter/material.dart';

class PickSearch extends StatefulWidget {
  @override
  _PickSearchState createState() => _PickSearchState();
}

class _PickSearchState extends State<PickSearch> {

  final Color logoColor = Color(0xff66c290);

  @override
  void initState() {
    super.initState();
    print('initState function ran');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: logoColor,
        title: Text('Search for component'),
          elevation: 0,
      ),
      body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          childAspectRatio: (2/1),
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
          children: <Widget>[

            //CPU
            ElevatedButton.icon(
              onPressed: (){
                Navigator.pushNamed(context, '/search_list');
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
                  Navigator.pushNamed(context, '/search_list');
                },
                icon: Icon(Icons.memory_sharp),
                label: Text('Memory'),
                style: ElevatedButton.styleFrom(
                    primary: logoColor
                )
            ),

            //STORAGE
            ElevatedButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/search_list');
                },
                icon: Icon(Icons.memory_sharp),
                label: Text('Storage'),
                style: ElevatedButton.styleFrom(
                    primary: logoColor
                )
            ),

            //MOTHERBOARD
            ElevatedButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/search_list');
                },
                icon: Icon(Icons.memory_sharp),
                label: Text('Motherboard'),
                style: ElevatedButton.styleFrom(
                    primary: logoColor
                )
            ),

            //GPU
            ElevatedButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/search_list');
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
                  Navigator.pushNamed(context, '/search_list');
                },
                icon: Icon(Icons.memory_sharp),
                label: Text('Power Supply'),
                style: ElevatedButton.styleFrom(
                    primary: logoColor
                )
            ),

            //CASE
            ElevatedButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/search_list');
                },
                icon: Icon(Icons.memory_sharp),
                label: Text('Case'),
                style: ElevatedButton.styleFrom(
                    primary: logoColor
                )
            ),

            //CPU COOLER
            ElevatedButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/search_list');
                },
                icon: Icon(Icons.memory_sharp),
                label: Text('CPU Cooler'),
                style: ElevatedButton.styleFrom(
                    primary: logoColor
                )
            ),

        ]
      )
    );
  }
}