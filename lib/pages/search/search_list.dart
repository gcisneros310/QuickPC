import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_pc/models/PCPartClasses/PCPart.dart';
import 'package:quick_pc/pages/search/part_filter.dart';
import 'package:quick_pc/pages/search/part_tile.dart';

class SearchList extends StatefulWidget {

  String partType;
  Filter fil;
  SearchList(this.partType, this.fil);

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {


  @override
  Widget build(BuildContext context) {

    final parts = Provider.of<List<Part>>(context);
    final filter_parts = widget.fil.getFilteredList(parts);

    return ListView.builder(

      //itemCount: this.widget.listItems.length,
      itemCount: filter_parts.length,
      itemBuilder: (context, index){
        return PartTile(part: filter_parts[index], partType: widget.partType,);

      },

    );

  }
}
