import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/CompletePCBuild.dart';
import 'package:quick_pc/pages/build_list/build_list.dart';

var partTitles = [
  'CPU', 'Motherboard', 'RAM', 'GPU', 'Power Supply',
  'Cooler', 'Hard Drive', 'Case'
];



class SavedListInfoPage extends StatefulWidget {
  CompletePCBuild buildObject;
  SavedListInfoPage({Key key}) : super(key: key);
  SavedListInfoPage.sendListInfo(CompletePCBuild obj){
    this.buildObject = obj;
  }
  @override
  _SavedListInfoPageState createState() => _SavedListInfoPageState();
}

class _SavedListInfoPageState extends State<SavedListInfoPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  createAlertDialog(BuildContext context) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Edit this list?"),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text("No"),
            onPressed: (){
              Navigator.of(context).pop();
              },
          ),
          MaterialButton(
            elevation: 5.0,
            child: Text("Yes"),
            onPressed: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(
                      builder:
                          (context) => PartList(widget.buildObject)));
              },
          ),
        ],
      );
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: widget.buildObject.partList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xFFF5F5F5),
                  child: Container(
                    width: 100,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              widget.buildObject.partList[index].productImageURL,
                              width: 125,
                              height: 125,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Container(
                                width: 125,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      partTitles[index],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      widget.buildObject.partList[index].partName,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                                widget.buildObject.partList[index].price.toStringAsFixed(2),
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                )
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }

            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          createAlertDialog(context);
        },
        icon: Icon(Icons.edit),
        label: const Text("Edit List"),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}
