import 'package:flutter/material.dart';
import 'package:quick_pc/services/auth.dart';

class BuildGuideList extends StatefulWidget {
  @override
  _BuildGuideList createState() => _BuildGuideList();
}


class _BuildGuideList extends State<BuildGuideList> {
  var stepsListTitles = ["Step 1","Step 2","Step 3","Step 4","Step 5"];
  @override
  Widget build(BuildContext context) {
    final Color logoColor = Color(0xff66c290);

    return Scaffold(
      appBar: AppBar(
        title: const Text("PC Build Guide"),
        backgroundColor: logoColor,
        elevation: 0.0,
      ),
        body: ListView.builder(
            itemBuilder: (context, index){
              return Card(
                child: ListTile(
                  onTap: (){},
                  title: Text(stepsListTitles[index])
                ),
              );
            }
            )
    );
  }




}