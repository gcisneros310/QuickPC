import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_pc/models/PCPartClasses/PCPart.dart';
import 'package:quick_pc/pages/search/part_tile.dart';

class PartsList extends StatefulWidget {

  String partType;
  PartsList(this.partType);

  @override
  _PartsListState createState() => _PartsListState();
}

class _PartsListState extends State<PartsList> {



  @override
  Widget build(BuildContext context) {

    final parts = Provider.of<List<Part>>(context);

    return ListView.builder(

      //itemCount: this.widget.listItems.length,
      itemCount: parts.length,
      itemBuilder: (context, index){
        return PartTile(part: parts[index], partType: widget.partType,);

      },



    );


    /*final cpus = Provider.of<List<CPU>>(context);


    return ListView.builder(
      itemCount: cpus.length,
      itemBuilder: (context, index) {
        return PartTile(cpu: cpus[index]);
      },
    );*/
  }
}
