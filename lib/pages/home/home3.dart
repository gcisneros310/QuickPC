import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/pages/account/account.dart';
import 'package:quick_pc/pages/build_guide/build_guide_intro_page.dart';
import 'package:quick_pc/pages/contact_us/contact_us.dart';
import 'package:quick_pc/services/auth.dart';

import 'GridDashboard.dart';

class Home3 extends StatefulWidget {
  @override
  _Home3State createState() => _Home3State();
}

class _Home3State extends State<Home3> {


  final Color logoColor = Color(0xff66c290);
  final Color greyout = Colors.grey[850];
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.file_copy_outlined),
                label: "Build Guides"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),
                label: "Account"
            ),
          ]

      ),
      backgroundColor: Color(0xff392850),
      body: Column(
        children: <Widget>[
          SizedBox(height:100),
          Padding(
            padding:EdgeInsets.only(left:16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        "Dashboard", style: GoogleFonts.exo2(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Home", style: GoogleFonts.exo2(color: Color(0xffa29aac), fontSize: 14, fontWeight: FontWeight.w600)
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset("assets/notificationpng.png", width: 24),
                  color: Color(0xff392850),
                  onPressed: (){},
                ),
              ],
            )
          ),
          SizedBox(height:30),
          Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(10),
                childAspectRatio: 1.2,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          //spreadRadius: 5,
                          blurRadius: 20,
                          offset: Offset(4,8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        Image.asset("assets/searchpcparts.jpg", width: 90),
                        Spacer(),
                        Text("Search PC", style: GoogleFonts.exo2(color: Color(0xffa29aac), fontSize: 14, fontWeight: FontWeight.w700)),

                      ],
                    ),

                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        Image.asset("assets/QuickPCLogo.png", width: 90),
                        Spacer(),
                        Text("Search PC", style: GoogleFonts.exo2(color: Color(0xffa29aac), fontSize: 14, fontWeight: FontWeight.w700)),

                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        Image.asset("assets/QuickPCLogo.png", width: 90),
                        Spacer(),
                        Text("Search PC", style: GoogleFonts.exo2(color: Color(0xffa29aac), fontSize: 14, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        Image.asset("assets/QuickPCLogo.png", width: 90),
                        Spacer(),
                        Text("Search PC", style: GoogleFonts.exo2(color: Color(0xffa29aac), fontSize: 14, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ],
              )
          )



        ],
      ),

    );


  }
}
