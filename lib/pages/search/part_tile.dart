import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/CPU.dart';
import 'package:quick_pc/models/PCPartClasses/Case_Part.dart';
import 'package:quick_pc/models/PCPartClasses/CompletePCBuild.dart';
import 'package:quick_pc/models/PCPartClasses/Cooler_Part.dart';
import 'package:quick_pc/models/PCPartClasses/GPU.dart';
import 'package:quick_pc/models/PCPartClasses/Motherboard_Part.dart';
import 'package:quick_pc/models/PCPartClasses/PSU_Part.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';
import 'package:quick_pc/models/PCPartClasses/RAM_Part.dart';
import 'package:quick_pc/models/PCPartClasses/Storage_Part.dart';
import 'package:quick_pc/pages/build_list/PCPartInfoPage.dart';
import 'package:quick_pc/pages/part_info/part_info.dart';

class PartTile extends StatefulWidget {

  final Part part;
  final String partType;
  CompletePCBuild buildObject;
  List<Part> compareList;
  PartTile({this.part, this.partType, this.compareList, this.buildObject});

  @override
  _PartTileState createState() => _PartTileState();
}

class _PartTileState extends State<PartTile>  {

  @override
  Widget build(BuildContext context){

    bool isChecked = false;


    String name = widget.part.partName;
    String imageURL = widget.part.productImageURL ?? "";
    double lowestPrice = 0.0;
    String data1 = "";
    String data2 = "";
    String data3 = "";


    switch (widget.partType){
      case 'cpu':
        CPU_Part cpu = widget.part;

        //imageURL = cpu.productImageURL;
        data1 = "Clock: " + cpu.base_clock.toString();
        data2 = "Cores: " + cpu.coreCount.toString();
        break;

      case 'gpu':
        GPU_Part g = widget.part;
        break;
      case 'ram':
        RAM_Part r = widget.part;
        data1 = r.stickCount.toString() + " x " + r.memoryCapacity;
        break;
      case 'motherboard':
        Motherboard_Part m = widget.part;
        data1 = m.cpuSocket;
        data2 = m.formFactor;
        break;
      case 'storage':
        Storage_Part s = widget.part;
        data1 = s.capacity;
        data2 = s.storageType;
        break;
      case 'psu':
        PSU_Part p = widget.part;
        data1 = p.wattage.toString() + " W";
        data2 = p.efficiencyRating;
        break;
      case 'case':
        Case_Part c = widget.part;
        data1 = c.motherboardFormFactor;
        break;
      case 'cooler':
        Cooler_Part c = widget.part;
        data1 = c.fanSpeed.toString();
        break;

    }

    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      child: FadeInImage(
                        placeholder: AssetImage('assets/images/cpu_icon.png'),
                        image: NetworkImage(imageURL),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),

                    trailing: Checkbox(

                      checkColor: Colors.white,

                      value: isChecked,
                      onChanged: (bool value) {
                        setState(() {
                          isChecked = value;
                          if (isChecked == true
                              && !widget.compareList.contains(widget.part)){
                            widget.compareList.add(widget.part);
                          }
                        });
                      },
                    ),
                    title: Text(name),
                    subtitle: Text('Price: ${lowestPrice}'
                        + "   " +  data1 + "   " + data2),

                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PCPartInfoPage(
                                    part: widget.part, partType: widget.partType, buildObj: widget.buildObject,),
                          )
                      );
                    },
                  );
                }
            )
        )
    );


    //
    // switch (widget.partType) {
    //
    //   case 'j':
    //     CPU_Part cpu = widget.part;
    //     return Padding(
    //         padding: EdgeInsets.only(top: 8.0),
    //         child: Card(
    //             margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
    //             child: StatefulBuilder(
    //               builder: (BuildContext context, StateSetter setState) {
    //                 return ListTile(
    //                   leading: Container(
    //                     width: 50,
    //                     height: 50,
    //                     child: FadeInImage(
    //                       placeholder: AssetImage('assets/images/cpu_icon.png'),
    //                       image: NetworkImage(cpu.productImageURL),
    //                       width: 50,
    //                       height: 50,
    //                       fit: BoxFit.cover,
    //                     ),
    //                   ),
    //
    //                   trailing: Checkbox(
    //
    //                     checkColor: Colors.white,
    //
    //                     value: isChecked,
    //                     onChanged: (bool value) {
    //                       setState(() {
    //                         isChecked = value;
    //                         if (isChecked == true){
    //                           widget.compareList.add(cpu);
    //                         }
    //                       });
    //                     },
    //                   ),
    //                   title: Text(cpu.partName),
    //                   subtitle: Text('Price: ${cpu.price}'
    //                       + '  Cores: ${cpu.coreCount}'),
    //
    //                   onTap: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                           builder: (context) =>
    //                               PCPartInfoPage(
    //                                   part: cpu, partType: widget.partType),
    //                         )
    //                     );
    //                   },
    //                 );
    //               }
    //             )
    //
    //         )
    //     );
    //
    //   case 'j':
    //     GPU_Part gpu = widget.part;
    //     return Padding(
    //         padding: EdgeInsets.only(top: 8.0),
    //         child: Card(
    //             margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
    //             child: ListTile(
    //               trailing: Checkbox(
    //
    //
    //                 checkColor: Colors.white,
    //
    //                 value: isChecked,
    //                 onChanged: (bool value) {
    //
    //                     isChecked = value;
    //
    //                 },
    //               ),
    //               title: Text(gpu.partName),
    //               subtitle: Text('Price: \$${gpu.price}'
    //                   + '  Memory: ${gpu.vram}'),
    //
    //               onTap: (){
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                       builder: (context) => PCPartInfoPage(part: gpu, partType: widget.partType),
    //                     )
    //                 );
    //
    //               },
    //             )
    //         )
    //     );
    //
    //
    // }



  }
}