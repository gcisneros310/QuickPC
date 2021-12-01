import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';

class CompareUI extends StatefulWidget {

  final List<Part> compareList;
  //List<Part> compareList;
  CompareUI({this.compareList});

  // List expansionState = [];
  //
  // doThing(){
  //   for(var i = 0; i < expansionState.length; i++)
  //     expansionState[i] = true;
  //   print(expansionState.length);
  //   print(expansionState);
  // }

  @override
  _CompareUIState createState() => _CompareUIState();
}

class _CompareUIState extends State<CompareUI> {





  @override
  Widget build(BuildContext context) {

    List<Part> compareList = widget.compareList;
    print(compareList);

    //testing
    List keys;

    //List<bool> expansionState = [];



    if (compareList.isNotEmpty){
      print(compareList.first.partAttributeMap.keys);
      keys = compareList.first.partAttributeMap.keys.toList();
      keys.remove("images");
      keys.remove("stores");
      keys.remove("part number");
      keys.remove("name");
      keys.remove("manufacturer");

      // widget.expansionState.length = keys.length;

      // for(var i = 0; i < keys.length; i++)
      //   widget.expansionState[i] = false;
    }
    else return Card(
        child: Text(
            "No Parts Selected",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            textAlign: TextAlign.center)
    );






    ListView chosenParts(){
      return ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: compareList.length,
          itemBuilder: (context, index) {
            return ListTile(

                leading: Container(
                  width: 50,
                  height: 50,
                  child: FadeInImage(
                    placeholder: AssetImage('assets/images/cpu_icon.png'),
                    image: NetworkImage(compareList[index].productImageURL),
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),

                trailing: IconButton(
                  icon: const Icon(Icons.highlight_remove),

                  onPressed: () {
                    setState(() {
                      compareList.removeAt(index);
                    });
                  },
                  
                ),

                title: Text("#"+(index + 1).toString() + ":  "
                    + compareList[index].partName
                    + "\n   \$" + compareList[index].price.toString() + "\n")
            );
          }
      );
    }

    ListView prices(){

      return ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: compareList.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text((index + 1).toString() + ":  \$"
                    + compareList[index].price.toString())
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

    ListView attributePanel(){

      return ListView.builder(

          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: keys.length,
          itemBuilder: (context, index) {
            
            //expansionState[index] = false;
            // print(index.toString() + " " + widget.expansionState[index].toString());

            return ExpansionTile(
              title: Text(keys[index].toUpperCase()),
              children: <Widget>[attributes(keys[index])],
              // initiallyExpanded: widget.expansionState[index] ?? false,

            );

          }
      );
    }




    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Card(child: chosenParts()),

          // ElevatedButton(
          //   child: Text("Expand All"),
          //   style: ElevatedButton.styleFrom(
          //     primary: Color(0xff66c290),
          //   ),
          //   onPressed: () {
          //
          //
          //     setState(() {
          //       //x = Expanded(child: ListView(children:[attributePanel()]));
          //       // widget.doThing();
          //
          //     });
          //   },
          //
          // ),

          Expanded(child: ListView(children:[attributePanel()]))
        ],
      )
    );

    // return ListView(
    //
    //   children: <Widget>[
    //
    //     Card(child: chosenParts()),
    //     Card(child: attributePanel()),
    //     SizedBox(
    //       height: 120,
    //     ),
    //
    //   ],
    //
    // );

  }
}