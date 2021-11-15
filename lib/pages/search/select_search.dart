import 'package:flutter/material.dart';
import 'package:quick_pc/services/realtimeDatabase.dart';

class SelectSearch extends StatefulWidget {
  SelectSearch({Key key}) : super(key: key);

  @override
  _SelectSearchState createState() => _SelectSearchState();
}

class _SelectSearchState extends State<SelectSearch> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();


  final Color logoColor = Color(0xff66c290);
  final Color greyout = Colors.grey;

  Icon searchIcon = const Icon(Icons.search, color: Colors.white,
      size: 28);
  Widget searchText = const Text('Select Part or Type Here');
  Widget title = const Text('hello');
  String searchTerm = '';


  var titles = [
    'CPU',
    'Memory',
    'Motherboard',
    'Storage',
    'Graphics Card',
    'Case',
    'Power Supply',
    'CPU Cooler'
  ];

  // var partIcons = [
  //   Icons.memory_sharp,
  //   Icons.memory_sharp,
  //   Icons.memory_sharp,
  //   Icons.memory_sharp,
  //   Icons.memory_sharp,
  //   Icons.memory_sharp,
  //   Icons.memory_sharp,
  // ];

  var types = [
    'cpu',
    'ram',
    'motherboard',
    'storage',
    'gpu',
    'case',
    'psu',
    'cooler'
  ];


  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: logoColor,
        automaticallyImplyLeading: true,
        title: Container(
          width: 250,
          child: TextFormField(
            controller: textController,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Select or Search by name...',
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFFAFAFA),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFFAFAFA),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              filled: true,
              contentPadding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
            ),

            textAlign: TextAlign.start,
          ),
        ),
        actions: [

          IconButton(
            onPressed: () {

              String id = "8wWhlPnAeyQKQ5Dp2ZrdiQE5Ibc2";
              getBuilds(id);


              // if (searchTerm != ""){
              //   Navigator.pushNamed(
              //     context, '/search', arguments: {'searchTerm': searchTerm},);
              // }
            },
            icon: searchIcon,
          )



          /*FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.search_rounded,
              color: FlutterFlowTheme.white,
              size: 30,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          )*/
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFF2E2E2E),
      body: ListView.builder(

      //itemCount: this.widget.listItems.length,
      itemCount: titles.length,

      itemBuilder: (context, index){

        return SelectTile(
          title: titles[index],
          partIcon: Icons.memory_sharp,
          partType: types[index],

        );

      },
    )
    );
  }
}



class SelectTile extends StatelessWidget {

  final String title;
  final dynamic partIcon;
  final String partType;

  SelectTile({this.title, this.partIcon, this.partType});

  Widget build(BuildContext context){

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: ListTile(
          leading: Icon(
            partIcon,
            size: 30,
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold),                    ),
          trailing: Icon(
            Icons.double_arrow,
            size: 30,
          ),
          tileColor: Color(0xff66c290),
          contentPadding:
          EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),

          onTap: (){

            Navigator.pushNamed(
              context, '/search', arguments: {
              'partType': partType},);

          },

        ),
      ),
    );

  }

}