import 'package:flutter/material.dart';
import 'package:quick_pc/pages/build_guide/build_guide_intro_page.dart';
import 'package:quick_pc/pages/build_list/build_list.dart';
import 'package:quick_pc/pages/contact_us/contact_us.dart';
import 'package:quick_pc/pages/home/swiperModel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_pc/pages/not_implemented/page_not_implemented.dart';




class DashboardCard extends StatelessWidget {
  final String name;
  final String totalParts;
  final String icon;
  final Color color;
  final int userChoice;

  DashboardCard({this.name, this.totalParts, this.icon, this.color, this.userChoice});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.0,
      margin: EdgeInsets.only(left: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: color,
      ),
      padding: EdgeInsets.symmetric(vertical:12),
      child: InkWell(
        onTap: (){
          switch(userChoice){
            case 0:
              {
                Navigator.pushNamed(context, '/select_search');
              }
              break;
            case 1:{
              Navigator.push(context, MaterialPageRoute(builder: (context) => PartList(CompletePCBuild())));
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => PageNotImplemented()));
            }
            break;
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(icon),
              width: 45.0,
              //color: Colors.white,
            ),
            SizedBox(height:12),
            Text(name,
                textAlign: TextAlign.center,
              style: kTitleStyle.copyWith(
                color: Colors.white,
                height: 1.0,
              ),
            ),
            SizedBox(height: 5),
            //Text("$doctor Doctors", style: kTitleStyle.copyWith(
            //  color: Colors.white,
            //  height: 1.0)
            //),
          ],
        ),
      ),
    );
  }
}
