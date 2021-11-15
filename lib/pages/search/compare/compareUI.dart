import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';

class CompareUI extends StatelessWidget {

  List<Part> compareList;

  CompareUI({this.compareList});



  @override
  Widget build(BuildContext context) {

    print(compareList);


    List keys;

    if (compareList.isNotEmpty){
      print("here");
      print(compareList.first.partAttributeMap.keys);
      keys = compareList.first.partAttributeMap.keys.toList();
      keys.remove("images");
      keys.remove("stores");
      keys.remove("part number");
      keys.remove("name");
      keys.remove("manufacturer");
    }
    else return Text("No Parts Selected");


    ListView chosenParts(){
      return ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: compareList.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text((index + 1).toString() + ":  "
                    + compareList[index].partName)
            );
          }
      );
    }

    ListView attributes(String attr){

      return ListView.builder(

          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: compareList.length,
          itemBuilder: (context, index) {

            return ListTile(
                title: Text(
                    "   " + (index + 1).toString() + ":  " +
                        compareList[index].partAttributeMap[attr]));

          }
      );
    }


    ListView attributeTitle(){

      return ListView.builder(

          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: keys.length,
          itemBuilder: (context, index) {

            return Card(

              child:ListView(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[

                    ListTile(
                        title: Text(keys[index].toUpperCase())
                    ),

                    attributes(keys[index])

                  ]

              )

            );
          }
      );
    }


    return ListView(

      children: <Widget>[

        Card(child: chosenParts() ),
        attributeTitle(),
        SizedBox(
          height: 120,
        ),

      ],

    );

  }
}