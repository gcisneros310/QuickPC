import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:quick_pc/models/cpu.dart';
import 'package:quick_pc/pages/search/part_tile.dart';

class PartsList extends StatefulWidget {
  @override
  _PartsListState createState() => _PartsListState();
}

class _PartsListState extends State<PartsList> {
  @override
  Widget build(BuildContext context) {

    final cpus = Provider.of<List<CPU>>(context);


    return ListView.builder(
      itemCount: cpus.length,
      itemBuilder: (context, index) {
        return PartTile(cpu: cpus[index]);
      },
    );
  }
}
