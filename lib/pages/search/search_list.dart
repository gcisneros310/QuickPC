import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';
import 'package:quick_pc/pages/search/filters/part_filter.dart';
import 'package:quick_pc/pages/search/part_tile.dart';

class SearchList extends StatefulWidget {

  String partType;
  Filter fil;
  bool clearFilter = true;
  List<Part> compareList;
  SearchList(this.partType, this.fil, this.compareList);

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {


  @override
  Widget build(BuildContext context) {

    final parts = Provider.of<List<Part>>(context);

    if (widget.clearFilter) {

      return ListView.builder(

        itemCount: parts.length,
        itemBuilder: (context, index){
          return PartTile(part: parts[index], partType: widget.partType, compareList: widget.compareList);
        },
      );

    } else {
      // Creating Filtered list
      final filteredParts = widget.fil.getFilteredList(parts, widget.partType);


      return ListView.builder(

        itemCount: filteredParts.length,
        itemBuilder: (context, index){
          return PartTile(part: filteredParts[index], partType: widget.partType, compareList: widget.compareList);

        },
      );
    }
  }

}
