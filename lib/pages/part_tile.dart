import 'package:flutter/material.dart';
import 'package:quick_pc/models/cpu.dart';
import 'package:quick_pc/pages/part_info.dart';

class PartTile extends StatelessWidget {

  final CPU cpu;
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
  }
}
