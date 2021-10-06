import 'package:flutter/material.dart';
import 'package:quick_pc/pages/build_guide/build_guide_intro_page.dart';
import 'package:quick_pc/pages/build_list/build_list.dart';
import 'package:quick_pc/pages/contact_us/contact_us.dart';
import 'package:quick_pc/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final Color logoColor = Color(0xff66c290);
  final Color greyout = Colors.grey;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    final title = 'Quick PC Home Page';

    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: logoColor,
        title: Text(title),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white),
            label: Text(
              "Logout",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            onPressed: () async{
              await _auth.signOut();
            },
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

          //SEARCH PART
          ElevatedButton.icon(
            onPressed: (){
              Navigator.pushNamed(context, '/pick_search');
            },
            icon: Icon(Icons.search),
            label: Text('Search Parts'),
            style: ElevatedButton.styleFrom(
              primary: logoColor
            )
          ),

          //BUILD PC
          ElevatedButton.icon(
            onPressed: (){
              //Navigator.pushNamed(context, '/pick_search');
            },
            icon: Icon(Icons.build),
            label: Text('Build PC'),
            style: ElevatedButton.styleFrom(
                primary: greyout
            )
          ),

          //Suggest PC
          ElevatedButton.icon(
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PartList())
              );
            },
            icon: Icon(Icons.desktop_windows_rounded),
            label: Text('Suggest PC'),
            style: ElevatedButton.styleFrom(
            )
          ),

          //BUILD GUIDES
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BuildGuideIntro()),
              );
            },
            icon: Icon(Icons.file_copy_outlined),
            label: Text('Build Guide'),
            style: ElevatedButton.styleFrom(
                primary: logoColor
            ),

          ),

          //Account
          ElevatedButton.icon(
            onPressed: (){
             // Navigator.pushNamed(context, '/pick_search');
            },
            icon: Icon(Icons.account_circle_outlined),
            label: Text('Account'),
            style: ElevatedButton.styleFrom(
                primary: greyout
            )
          ),

          //CONTACT US
          ElevatedButton.icon(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactUs()),
              );
            },
            icon: Icon(Icons.email_outlined),
            label: Text('Contact Us'),
            style: ElevatedButton.styleFrom(
                primary: logoColor
            )
          ),

          //ABOUT US
          ElevatedButton.icon(
            onPressed: (){
             // Navigator.pushNamed(context, '/pick_search');
            },
            icon: Icon(Icons.info_outline),
            label: Text('About Us'),
            style: ElevatedButton.styleFrom(
                primary: greyout
            )
          ),
        ]
      )
    );
  }
}
