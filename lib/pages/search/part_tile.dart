import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/CPU.dart';
import 'package:quick_pc/models/PCPartClasses/GPU.dart';
import 'package:quick_pc/models/PCPartClasses/PCPart.dart';
import 'package:quick_pc/pages/part_info/part_info.dart';

class PartTile extends StatelessWidget {

  final Part part;
  final String partType;
  PartTile({this.part, this.partType});

  @override
  Widget build(BuildContext context){

    switch (partType) {
      case 'cpu':
        CPU_Part cpu = part;
        return Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: ListTile(
                  title: Text(cpu.partName),
                  subtitle: Text('Price: ${cpu.price}'),
                  onTap: (){
                    // Navigator.pushNamed(context, '/part_info',
                    //     arguments: cpu);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          //builder: (context) => PartInfo(cpu: cpu),
                        ));
                  },
                )
            )
        );

      case 'gpu':
        GPU_Part gpu = part;
        return Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: ListTile(
                  title: Text(gpu.partName),
                  subtitle: Text('Data: ${gpu.base_clock}'),
                  onTap: (){
                    // Navigator.pushNamed(context, '/part_info',
                    //     arguments: cpu);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          //builder: (context) => PartInfo(cpu: cpu),
                        ));
                  },
                )
            )
        );
    }

    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              title: Text(part.partName),
              subtitle: Text('Data: ${part.price}'),
              onTap: (){
                // Navigator.pushNamed(context, '/part_info',
                //     arguments: cpu);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      //builder: (context) => PartInfo(cpu: cpu),
                    ));
              },
            )
        )

    );

  }


/*  final CPU cpu;
  PartTile({this.cpu});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text(cpu.name),
          subtitle: Text('\$${cpu.price}  Core Clock: ${cpu.coreClock}'),
          onTap: (){
            // Navigator.pushNamed(context, '/part_info',
            //     arguments: cpu);

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PartInfo(cpu: cpu),
                ));
          },
        )
      )

    );
  }*/
}
