import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/models/PCPartClasses/CPU.dart';
import 'package:quick_pc/models/PCPartClasses/CompletePCBuild.dart';
import 'package:quick_pc/models/PCPartClasses/GPU.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';
import 'package:quick_pc/pages/build_guide/build_guide_intro_page.dart';
import 'package:quick_pc/pages/build_list/SavedListInfoPage.dart';
import 'package:quick_pc/pages/contact_us/contact_us.dart';
import 'package:quick_pc/pages/home/popular_fields.dart';
import 'package:quick_pc/pages/home/swiperModel.dart';
import 'package:quick_pc/pages/home/trending_fields.dart';
import 'package:quick_pc/pages/universal_drawer/NavigationDrawer.dart';
import 'package:quick_pc/services/auth.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:quick_pc/services/realtimeDatabase.dart';
import 'package:quick_pc/shared/loading.dart';
import 'dashboard_card.dart';
import 'package:quick_pc/pages/build_list/PCPartInfoPage.dart';

import 'notifications2.dart';



class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}
List<Part> demoList = [
  CPU_Part.valueConstructors(
      'Intel Core i9-10940X - Core i9 10th Gen Cascade Lake 14-Core 3.3 GHz LGA 2066 165W Desktop Processor - BX8069510940X',
      'Intel',
      799.99,
      'https://www.newegg.com/intel-core-i9-10th-gen-core-i9-10940x/p/N82E16819118109',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/19-118-109-V01.jpg',
      3.3,
      4.8,
      12
  ),
  CPU_Part.valueConstructors(
      'AMD Ryzen 7 5700G 3.8 GHz 8-Core Processor - 100-100000263BOX',
      'AMD',
      324.99,
      'https://www.newegg.com/amd-ryzen-7-5700g-ryzen-7-5000-g-series/p/N82E16819113682',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/19-113-682-V01.jpg',
      3.8,
      4.6,
      8
  ),
  CPU_Part.valueConstructors(
      'AMD Threadripper 3990X 2.9 GHz 64-Core Processor - 100-100000163WOF',
      'AMD',
      3964.99,
      'https://www.newegg.com/amd-ryzen-threadripper-3990x/p/N82E16819113620',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/19-113-620-V02.jpg',
      2.9,
      4.3,
      64
  ),
  CPU_Part.valueConstructors(
      'AMD Ryzen 7 3800X 3.9 GHz 8-Core Processor - Ryzen 7 3800X100-100000025BOX',
      'AMD',
      348.75,
      'https://www.newegg.com/amd-ryzen-7-3800x/p/N82E16819113104',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/19-113-104-V03.jpg',
      3.9,
      4.5,
      8
  ),
  CPU_Part.valueConstructors(
      'Intel Core i7-9700K 3.6 GHz 8-Core Processor - BX80684I79700K',
      'Intel',
      308.88,
      'https://www.newegg.com/core-i7-9th-gen-intel-core-i7-9700k/p/N82E16819117958',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/19-117-958-V22.jpg',
      3.6,
      4.9,
      8
  ),
  CPU_Part.valueConstructors(
      'Intel Core i9-9900K 3.6 GHz 8-Core Processor - BX80684I99900K',
      'Intel',
      465.86,
      'https://www.newegg.com/core-i9-9th-gen-intel-core-i9-9900k/p/N82E16819117957',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/19-117-957-01.jpg',
      3.6,
      5,
      8
  ),
  GPU_Part.demoConstructor(
      'ASUS TUF Gaming NVIDIA GeForce RTX 3080 V2 OC Edition Graphics Card (PCIe 4.0, 10GB GDDR6X, LHR, HDMI 2.1, DisplayPort 1.4a)',
      'ASUS',
      1532.99,
      'https://www.newegg.com/asus-geforce-rtx-3080-tuf-rtx3080-o10g-v2-gaming/p/N82E16814126525?Item=9SIAPMXFGT6270',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/14-126-525-V01.jpg'
  ),
];

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
                RichText(
                  //textAlign: TextAlign.center,
                  text: TextSpan(
                    //text: "By creating an account, you are agreeing to our \n",
                    //style: GoogleFonts.exo2(color: Colors.white, fontSize: 16),
                    children: [
                      TextSpan(
                        text: "Popular",
                        style: GoogleFonts.exo2(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap =(){
                        },
                      ),
                    ],
                  ),
                ),
                Spacer(),
                RichText(
                  //textAlign: TextAlign.center,
                  text: TextSpan(
                    //text: "By creating an account, you are agreeing to our \n",
                    //style: GoogleFonts.exo2(color: Colors.white, fontSize: 16),
                    children: [
                      TextSpan(
                        text: "View All",
                        style: GoogleFonts.exo2(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap =(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PopularFields()));
                        },
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget popularPictureRow(String itemType, double price, String imageAsset,int demoIndex, CPU_Part cpuList){

    //Delete these later
    CompletePCBuild buildObj = new CompletePCBuild.demoConstructor();
    buildObj.partList = demoList;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => PCPartInfoPage.loadPartInfo(buildObj, cpuList, "cpu")));
        },
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
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image:DecorationImage(
                              //fit: BoxFit.fill,
                              image: NetworkImage(imageAsset),
                          ),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal:20, vertical: 10),
                      width: 190,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  child: Text(itemType, style: GoogleFonts.exo2(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,)),
                              //Icon(Icons.add_circle)
                            ],
                          ),
                          Text("\$$price", style: GoogleFonts.exo2(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w500)),
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
                RichText(
                  //textAlign: TextAlign.center,
                  text: TextSpan(
                    //text: "By creating an account, you are agreeing to our \n",
                    //style: GoogleFonts.exo2(color: Colors.white, fontSize: 16),
                    children: [
                      TextSpan(
                        text: "Trending",
                        style: GoogleFonts.exo2(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap =(){
                        },
                      ),
                    ],
                  ),
                ),
                Spacer(),
                RichText(
                  //textAlign: TextAlign.center,
                  text: TextSpan(
                    //text: "By creating an account, you are agreeing to our \n",
                    //style: GoogleFonts.exo2(color: Colors.white, fontSize: 16),
                    children: [
                      TextSpan(
                        text: "View All",
                        style: GoogleFonts.exo2(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap =(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>TrendingFields()));
                        },
                      ),
                    ],
                  ),
                ),
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
                      image: DecorationImage(image: NetworkImage("https://i.imgur.com/z2qL0zq.gif"), fit: BoxFit.cover),
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
    CompletePCBuild buildObj = new CompletePCBuild.demoConstructor();
    buildObj.partList = demoList;
    //HERE
    List<Part> list;

    Future getList() async {
      list = await getPopCPU();
      return list;
    }
    //getList();
    drawer: Drawer();




      return FutureBuilder(
        future: getPopCPU(),
        builder: (context, projectSnap) {
          if (projectSnap.connectionState == ConnectionState.none &&
              projectSnap.hasData == null && projectSnap.data == null) {
            //print('project snapshot data is: ${projectSnap.data}');
            return Loading();
          }
          if(projectSnap.data == null) {
            print("IF PROJECTSNAP.HASDATA");
            print(projectSnap.data.runtimeType);
            return Loading();
          }
          return Scaffold(
          backgroundColor: Colors.grey[300],
          drawer: NavigationDrawer(),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black54),
            elevation: 0.0,
            backgroundColor: Colors.grey[500],
            title: Text("Home"),
            centerTitle: true,
            actions: [
              InkWell(
                onTap:() async{
                 /* final fb = FirebaseDatabase.instance;
                  final ref = fb.reference();
                  Notifications_Data nData = new Notifications_Data();
                  nData.name = "No GF";
                  nData.imageURL = "https://i.gyazo.com/c2a391a8cb95873621103c038562e3db.gif";
                  nData.message="Hehe";
                  await ref.child("notifications/").push().update(nData.toJson());*/
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications2()));
              },
                  child: Icon(Icons.notifications, color: Colors.black54))
            ],
          ),
          body: Container(
            child: ListView(
              children: [
                swiperImageRow(),
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
                              for(int i = 49; i > 41; --i)
                                popularPictureRow(projectSnap.data[i].partName, projectSnap.data[i].price, projectSnap.data[i].productImageURL, 3,projectSnap.data[i]),
                              SizedBox(height:100),
                            ],
                          ),
                        ),
                        popularRow(),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for(int i = 7; i != -1; --i)
                              popularPictureRow(projectSnap.data[i].partName, projectSnap.data[i].price, projectSnap.data[i].productImageURL, 3,projectSnap.data[i]),
                              SizedBox(height:100),
                            ],
                          ),
                        ),
                        SizedBox(height:15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          );
        }
      );
      }

}
