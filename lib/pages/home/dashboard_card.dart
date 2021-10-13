import 'package:flutter/material.dart';

import 'package:quick_pc/pages/home/swiperModel.dart';
import 'package:flutter_svg/flutter_svg.dart';




class DashboardCard extends StatelessWidget {
  final String name;
  final String totalParts;
  final String icon;
  final Color color;

  DashboardCard({this.name, this.totalParts, this.icon, this.color});

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

    );
  }
}
