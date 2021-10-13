import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/pages/account/account.dart';
import 'package:quick_pc/pages/build_guide/build_guide_intro_page.dart';
import 'package:quick_pc/pages/contact_us/contact_us.dart';
import 'package:quick_pc/services/auth.dart';

class GridDashboard extends StatefulWidget {
  @override
  _GridDashboardState createState() => _GridDashboardState();
}

class _GridDashboardState extends State<GridDashboard> {


  final Color logoColor = Color(0xff66c290);
  final Color greyout = Colors.grey[850];
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    Item searchParts = new Item(title: "Search Parts", subtitle: "", event: "", img: "assets/searchpcparts.jpg");
    Item buildPC = new Item(title: "Build PC", subtitle: "", event: "", img: "assets/quickpclogo.png");
    var size = MediaQuery.of(context).size;
    List<Item> myList = [searchParts, buildPC];
    return Flexible(
        child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right:16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data){
            return RaisedButton(
              color: Color(0xff4c356c), //change this into another color
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: (){


                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUs()),
                );
              },

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(data.img, width: 75),
                  SizedBox(height:14),
                  Text(
                    data.title,
                    style: GoogleFonts.exo2(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600 )
                  ),
                  SizedBox(height:8),
                  Text(
                      data.subtitle,
                      style: GoogleFonts.exo2(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600 )
                  ),
                  SizedBox(height:14),
                  Text(
                      data.event,
                      style: GoogleFonts.exo2(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600 )
                  ),
                ],
            ));
        }).toList()
        )
    );
  }
}

class Item{
  String title;
  String subtitle;
  String event;
  String img;
  Item({this.title, this.subtitle, this.event, this.img});
}
