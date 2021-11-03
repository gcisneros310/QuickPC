import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';
import 'package:quick_pc/pages/search/part_tile.dart';

class SearchList extends StatefulWidget {

  String partType;
  SearchList(this.partType);

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {


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

  }
}
