import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/CPU.dart';
import 'package:quick_pc/models/PCPartClasses/GPU.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';
import 'package:quick_pc/pages/build_list/PCPartInfoPage.dart';
import 'package:quick_pc/pages/part_info/part_info.dart';

class PartTile extends StatelessWidget {

  final Part part;
  final String partType;
  PartTile({this.part, this.partType});

  @override
  Widget build(BuildContext context){

    //new plan
    //Have switch case define 5 generic data set for a type
    // have one tile display them

    //name, image, price, data1, data2

    switch (partType) {
      case 'cpu':
        CPU_Part cpu = part;
        return Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: ListTile(
                  leading: Image.network(
                    cpu.productImageURL,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(cpu.partName),
                  subtitle: Text('Price: ${cpu.price}'
                      + '  Cores: ${cpu.coreCount}'),

                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PCPartInfoPage(part: cpu, partType: partType),
                        )
                    );

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
                  subtitle: Text('Price: \$${gpu.price}'
                      + '  Memory: ${gpu.vram}'),

                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PCPartInfoPage(part: gpu, partType: partType),
                        )
                    );

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
              subtitle: Text('Price: ${part.price}'),
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
