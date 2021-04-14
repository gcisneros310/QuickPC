import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    final title = 'Quick PC Home Page';

    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(title),
      ),


      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        childAspectRatio: (2/1),
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        crossAxisCount: 2,
        children: <Widget>[

          //SEARCH PART
          ElevatedButton.icon(
            onPressed: (){
              Navigator.pushNamed(context, '/pick_search');
            },
            icon: Icon(Icons.search),
            label: Text('Search For Parts'),
            style: ElevatedButton.styleFrom(
              primary: Colors.green[800]
            )
          ),

          //BUILD PC
          ElevatedButton.icon(
            onPressed: (){
              Navigator.pushNamed(context, '/pick_search');
            },
            icon: Icon(Icons.build),
            label: Text('Build PC'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[800]
            )
          ),

          //Suggest PC
          ElevatedButton.icon(
            onPressed: (){
              Navigator.pushNamed(context, '/pick_search');
            },
            icon: Icon(Icons.desktop_windows_rounded),
            label: Text('Suggest PC'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[800]
            )
          ),

          //BUILD GUIDES
          ElevatedButton.icon(
            onPressed: (){
              Navigator.pushNamed(context, '/pick_search');
            },
            icon: Icon(Icons.file_copy_outlined),
            label: Text('Build Guides'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[800]
            )
          ),

          //Account
          ElevatedButton.icon(
            onPressed: (){
              Navigator.pushNamed(context, '/pick_search');
            },
            icon: Icon(Icons.account_circle_outlined),
            label: Text('Account'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[800]
            )
          ),

          //CONTACT US
          ElevatedButton.icon(
            onPressed: (){
              Navigator.pushNamed(context, '/pick_search');
            },
            icon: Icon(Icons.email_outlined),
            label: Text('Contact Us'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[800]
            )
          ),

          //ABOUT US
          ElevatedButton.icon(
            onPressed: (){
              Navigator.pushNamed(context, '/pick_search');
            },
            icon: Icon(Icons.info_outline),
            label: Text('About Us'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[800]
            )
          ),
        ]
      )
    );
  }
}
