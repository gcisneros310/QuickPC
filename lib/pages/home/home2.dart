import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/pages/account/account.dart';
import 'package:quick_pc/pages/build_guide/build_guide_intro_page.dart';
import 'package:quick_pc/pages/contact_us/contact_us.dart';
import 'package:quick_pc/pages/home/swiperModel.dart';
import 'package:quick_pc/pages/not_implemented/page_not_implemented.dart';
import 'package:quick_pc/services/auth.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'dashboard_card.dart';
import 'home.dart';


class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final Color logoColor = Color(0xff66c290);
  final Color greyout = Colors.grey[850];
  final AuthService _auth = AuthService();
  int _current = 0;
  int _currentIndex = 0;
  String currentPage;
  final List _children = [];
  
  List<T> map<T>(List list, Function handler){
    List<T> result = [];
    for( var i =0; i< list.length; i++){
      result.add(handler(i,list[i]));
    }
  }
  Widget searchBar(){
    return Container(
      height: 70,
      padding: EdgeInsets.only(right: 20, left:20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Column(
            children: [
              Material(
                borderRadius: BorderRadius.circular(5.0),
                shadowColor: Colors.black,
                elevation: 1.3,
                child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Search...",
                        prefixIcon: Icon(Icons.search),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                        )
                    )
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  Widget dashboardRow(){
    return Container(
      padding: EdgeInsets.only(right: 20),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Dashboard",
              style: GoogleFonts.exo2(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold)),
          Text("View All",
              style: GoogleFonts.exo2(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
  Widget pictureRow(String name, String assetImage){
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.up,
        children: [
          Container(
            width: 140,
            child: Center(
              child: Text(name, style: GoogleFonts.exo2(color: Colors.black54, fontSize: 20)),
            ),
          ),
          Container(
            height: 100,
            width: 140,
            decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.contain, image: AssetImage(assetImage)),
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                topLeft:Radius.circular(6),
                topRight:Radius.circular(6),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget popularRow(){
    return Container(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Container(
            padding: EdgeInsets.only(
              left:10, right:20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular",
                    style: GoogleFonts.exo2(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold)),
                Text("View All",
                    style: GoogleFonts.exo2(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget popularPictureRow(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity((0.5)),
                  offset: Offset(0,3),
                ),
              ],
            ),
            child: Container(
              width: 190,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 190,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image:DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/amdryzen.jpg')
                        ),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:20, vertical: 10),
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$420.00", style: GoogleFonts.exo2(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w700)),
                            Icon(Icons.add_circle)
                          ],
                        ),
                        Text("AMD Ryzen 3700x", style: GoogleFonts.exo2(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w700)),
                      ],
                    ),

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget featuredRow(){
    return Container(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Container(
            padding: EdgeInsets.only(
              left:10, right:20
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Featured",
                    style: GoogleFonts.exo2(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold)),
                Text("View All",
                    style: GoogleFonts.exo2(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget swiperImageRow(){
    return Padding(
      padding: const EdgeInsets.only(top:16),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left:16, right:16),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              child: Swiper(
                onIndexChanged:(index){
                  setState(() {
                    _current = index;
                  });
                },
                autoplay: true,
                layout: SwiperLayout.DEFAULT,
                itemCount: swiperModel.length,
                itemBuilder: (BuildContext context,int index){
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: AssetImage("assets/amdryzen.jpg"),
                          fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget dashboardRowButtons(){
    return Container(
      height:160,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.8,
        ),
        children: <Widget>[
          gridItems(Icons.search, "Search", 0),
          gridItems(Icons.build, "Build PC", 1),
          gridItems(Icons.computer, "Suggest PC", 2),
          gridItems(Icons.file_copy_outlined, "Build Guide", 3),
          gridItems(Icons.info_outline, "About Us", 4),

        ],
      ),
    );
  }
  gridItems(icon, name, integer){
    return Column(
      children: [
        InkWell(
          onTap:(){
            switch(integer){
              case 0:
                {
                  Navigator.pushNamed(context, '/select_search');
                }
                break;
              case 1:{
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
              }
              break;
              case 2:{
              }
              break;
              case 3:{
                Navigator.push(context, MaterialPageRoute(builder: (context) => BuildGuideIntro()));
              }
              break;
              case 4:{
              }
              break;
              default:{
                print("Hello");
              }
              break;
            }
          },
          child: CircleAvatar(
            child: Icon(
              icon,
              size:16.0,
              color: Colors.white,
            ),
           backgroundColor: logoColor,
           // backgroundColor: Colors.deepOrange.withOpacity(0.9),
          ),
        ),
        SizedBox(height:10.0),
        Text(name, style: GoogleFonts.exo2(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    var _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;
    double screenHeight = _mediaQueryData.size.height;
    //orientation = _mediaQueryData.orientation;

    drawer: Drawer();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
        elevation: 0.0,
        backgroundColor: Colors.grey[500],
        title: Text("Home Screen"),
        centerTitle: true,
        actions: [
          Icon(Icons.notifications_none, color: Colors.black54)
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            //swiperImageRow(),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Container(
                child: dashboardRow(),
              )
            ),
            //dashboardRowButtons(),
            Padding(
              padding: EdgeInsets.only(left:10),
              child: Container(
                width: double.infinity,
                height: 110.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: <Widget> [
                    DashboardCard(
                      name: "Search PC",
                      color: colorBlue,
                      totalParts: "27",
                      icon: "assets/desktop.png",
                      userChoice: 0,
                    ),
                    DashboardCard(
                      name: "Build PC",
                      color: colorPurple,
                      totalParts: "27",
                      icon: "assets/build.png",
                      userChoice: 1,
                    ),
                    DashboardCard(
                      name: "Suggest PC",
                      color: colorOrange,
                      totalParts: "27",
                      icon: "assets/suggest.png",
                      userChoice: 5,
                    ),
                    DashboardCard(
                      name: "Build Guide",
                      color: colorGreen,
                      totalParts: "27",
                      icon: "assets/guide.png",
                      userChoice: 3,
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left:10),
              child: Container(
                child: Column(
                  children: [
                    //searchBar(),
                    featuredRow(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          popularPictureRow(),
                          popularPictureRow(),
                          popularPictureRow(),
                          popularPictureRow(),
                        ],
                      ),
                    ),
                    popularRow(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          popularPictureRow(),
                          popularPictureRow(),
                          popularPictureRow(),
                          popularPictureRow(),
                          SizedBox(height:100),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),


    );


  }
}
