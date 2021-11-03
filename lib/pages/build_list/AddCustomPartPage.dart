
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:quick_pc/models/PCPartClasses/CPU.dart';
import 'package:quick_pc/models/PCPartClasses/Case_Part.dart';
import 'package:quick_pc/models/PCPartClasses/CompletePCBuild.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/models/PCPartClasses/Cooler_Part.dart';
import 'package:quick_pc/models/PCPartClasses/GPU.dart';
import 'package:quick_pc/models/PCPartClasses/Motherboard_Part.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';
import 'package:quick_pc/models/PCPartClasses/PSU_Part.dart';
import 'package:quick_pc/models/PCPartClasses/RAM_Part.dart';
import 'package:quick_pc/models/PCPartClasses/Storage_Part.dart';
import 'package:quick_pc/pages/universal_drawer/NavigationDrawer.dart';
import 'package:image_picker/image_picker.dart';
import 'build_list.dart';

var textFieldTitles = [
  'Part Title',
  'Manufacturer',
  'Price'
];

class AddCustomPartPage extends StatefulWidget {
  CompletePCBuild buildObject = null;
  int index;
  AddCustomPartPage({Key key}) : super(key: key);
  AddCustomPartPage.partConstructor(CompletePCBuild buildObject, int listIndex){
    this.index = listIndex;
    this.buildObject = buildObject;

    print("CONSTRUCTOR INDEX: " + this.index.toString());
  }
  @override
  _AddCustomPartPageState createState() => _AddCustomPartPageState();
}

class _AddCustomPartPageState extends State<AddCustomPartPage> {
  File selectedDeviceImage = null;
  bool imageSelected = false;
  Future pickImage(ImageSource source) async {
    try{
      final XFile image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final tempImage = File(image.path);
      setState(() => this.selectedDeviceImage = tempImage);
    } on PlatformException catch (e) {
      print("SHIT DIDNT WORK");
      print(e);
    }

  }

  String partTitle = '';
  String partManufacturer = '';
  String price = '0.00';

  TextEditingController titleTextController;
  TextEditingController manufacturerTextController;
  TextEditingController priceTextController;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  Part temp;
  @override
  void initState() {
    super.initState();
    titleTextController = TextEditingController();
    manufacturerTextController = TextEditingController();
    priceTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    temp = returnDefaultPart(widget.index);
    TextField titleTextField = TextField(
      controller: titleTextController,
      decoration: InputDecoration(
        border:  OutlineInputBorder(),
        labelText: 'Enter part title here',
      ),
    );
    TextField manufacturerTextField = TextField(
      controller: manufacturerTextController,
      decoration: InputDecoration(
        border:  OutlineInputBorder(),
        labelText: 'Enter manufacturer here',
      ),
    );
    TextField priceTextField = TextField(
      controller: priceTextController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border:  OutlineInputBorder(),
        labelText: 'Enter price here (dollars)',
      ),
    );

    print("PART INDEX : " + widget.index.toString());
    for(int x = 0; x < widget.buildObject.partList.length; x++){
      print(widget.buildObject.partList[x].partName);
    }
    var attributeList = [ partTitle, partManufacturer, price ];
    var textControllerList = [
      titleTextController,
      manufacturerTextController,
      priceTextController
    ];

    var textFieldList = [titleTextField, manufacturerTextField, priceTextField];
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: true,
        title: Text(
          'Enter Custom Part Info',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: Container(
                  width: 500,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Text(
                    "Couldn't find the part within QuickPC? No worries! \n\n"
                        "Enter the basic data for your PC part in the text fields below to add a custom part to the build list!",
                    textAlign: TextAlign.center,
                    style: TextStyle(

                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: Container(
                  width: 500,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: ListView.builder(
                      itemCount: 3,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int listIndex) {
                        return Container(
                          padding: EdgeInsets.all(8.0),
                          width: 100,
                          height: 75,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                textFieldTitles[listIndex],
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                  child: textFieldList[listIndex],
                                ),
                              )
                            ],
                          ),
                        );
                      }

                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: Container(
                  width: 500,
                  height: 175,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Choose photo from the camera or gallery',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            TextButton.icon(
                              onPressed: () {
                                pickImage(ImageSource.gallery);
                                setState(() {
                                  temp = returnDefaultPart(widget.index);

                                  print("GALLERY CRICKED");
                                  temp.deviceImage = selectedDeviceImage;
                                  temp.deviceImagePresent = true;
                                  if(selectedDeviceImage != null) {
                                    imageSelected = true;
                                  }
                                });
                              },
                              icon: Icon(Icons.image),
                              label: Text("Gallery"),
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.teal,
                                onSurface: Colors.grey,
                              ),

                            ),
                            TextButton.icon(
                              onPressed: () {

                                setState(() {
                                  pickImage(ImageSource.camera);
                                  temp = returnDefaultPart(widget.index);
                                  temp.deviceImage = selectedDeviceImage;
                                  temp.deviceImagePresent = true;
                                  print("CAMERA CRICKED");
                                  if(selectedDeviceImage != null) {
                                    imageSelected = true;
                                    print("THIS IS BIG TRUE");
                                  }
                                });

                              },
                              icon: Icon(Icons.camera),
                              label: Text("Camera"),
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.teal,
                                onSurface: Colors.grey,
                              ),
                            )
                          ],
                        ),
                       temp.deviceImagePresent == false
                            ? Image.network(
                          temp.productImageURL,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,

                        )
                            : Image.file(
                          temp.deviceImage,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ]
                    )
                  ),
                ),
              ),
            ],
          ),
            )

          ),


      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: const Text("Add Part"),
        onPressed: () {

          temp = returnDefaultPart(widget.index);
          if(selectedDeviceImage != null) {
            temp.deviceImage = selectedDeviceImage;
            temp.deviceImagePresent = true;
          }
          print(temp.partName);
          temp.partName = titleTextController.text;
          temp.price = double.parse(priceTextController.text);
          temp.manufacturerName = manufacturerTextController.text;
          widget.buildObject.partList[widget.index] = temp;


          print("title OF NEW OBJECT: " +  widget.buildObject.partList[widget.index].partName.toString());
          print("manuf OF NEW OBJECT: " +  widget.buildObject.partList[widget.index].manufacturerName.toString());
          print("PRICE OF NEW OBJECT: " +  widget.buildObject.partList[widget.index].price.toString());
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => PartList(widget.buildObject))
          );
        },
      ),
      drawer: SafeArea(child: NavigationDrawer()),
    );

  }

  Part returnDefaultPart(int index){
    switch(index) {
      case 0:
        return new CPU_Part();
        break;
      case 1:
        return Motherboard_Part();
        break;
      case 2:
        return RAM_Part();
        break;
      case 3:
        return GPU_Part();
        break;
      case 4:
        return PSU_Part();
        break;
      case 5:
        return Cooler_Part();
        break;
      case 6:
        return Storage_Part();
        break;
      case 7:
        return Case_Part();
        break;
      default:
        return null;
        break;
    }
  }
}
