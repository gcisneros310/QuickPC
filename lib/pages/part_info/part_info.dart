import 'package:flutter/material.dart';
import 'package:quick_pc/models/cpu.dart';

class PartInfo extends StatefulWidget {
  final CPU cpu;

  PartInfo({Key key, @required this.cpu}) : super(key:key);

  @override
  _PartInfoState createState() => _PartInfoState();
}

class _PartInfoState extends State<PartInfo> {

  final Color logoColor = Color(0xff66c290);

  //temp
  List listOfParts = List<String>.generate(10000, (i) => "Spec $i");


  @override
  Widget build(BuildContext context) {
    //print(widget.cpu.name);



    return Scaffold(
      body: DefaultTabController(

        length: 3,
        child: Scaffold(

          backgroundColor: Colors.grey[850],

          appBar: AppBar(
            backgroundColor: logoColor,

            bottom: TabBar(
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Info',
                    icon: Icon(Icons.info_outline)),
                Tab(text: 'Buy',
                    icon: Icon(Icons.shopping_cart)),
                Tab(text: 'Reviews',
                    icon: Icon(Icons.rate_review)),
              ],
            ),
            title: Text('${widget.cpu.name}'),
          ),
          body: TabBarView(
            children: [
              //Info tab Contents
              ListView.builder(
                itemCount: listOfParts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${listOfParts[index]}'),
                    tileColor: Colors.white,
                    onTap: (){

                    },
                  );
                },
              ),

              //Buy Tab Contents
              Icon(Icons.shopping_cart),

              //Reviews Tab Contents
              Icon(Icons.rate_review),
            ],
          ),
        ),
      ),
    );
  }
}
