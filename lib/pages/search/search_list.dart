import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';
import 'package:quick_pc/pages/search/filters/part_filter.dart';
import 'package:quick_pc/pages/search/part_tile.dart';
import 'package:quick_pc/shared/loading.dart';

class SearchList extends StatefulWidget {

  String partType;
  Filter fil;
  bool clearFilter = true;
  String name;
  bool searchByName = false;
  List<Part> compareList;
  SearchList(this.partType, this.fil, this.compareList);

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {


  @override
  Widget build(BuildContext context) {

    final parts = Provider.of<List<Part>>(context);

    while(parts == null) {
      return Loading();
    }

    if (widget.searchByName){
      final nameList = widget.fil.filterByName(parts, widget.name);

      print(nameList);

      return ListView.builder(

        itemCount: nameList.length,
        itemBuilder: (context, index){
          return PartTile(part: nameList[index], partType: widget.partType, compareList: widget.compareList);

        },
      );
    }


    if (widget.clearFilter) {

      return ListView.builder(

        itemCount: parts.length,
        itemBuilder: (context, index){
          return PartTile(part: parts[index], partType: widget.partType, compareList: widget.compareList);
        },
      );

    } else {
      // Creating Filtered list
      List filteredParts = widget.fil.getFilteredList(parts, widget.partType);


      return ListView.builder(

        itemCount: filteredParts.length,
        itemBuilder: (context, index){
          return PartTile(part: filteredParts[index], partType: widget.partType, compareList: widget.compareList);

        },
      );
    }
  }

}
