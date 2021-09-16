import 'package:quick_pc/pages/build_guide/build_guide_list.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Step0_PSU extends StatefulWidget {
  Step0_PSU({Key key}) : super(key: key);

  @override
  _Step0_PSUState createState() => _Step0_PSUState();
}

class _Step0_PSUState extends State<Step0_PSU> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayerController.convertUrlToId('https://www.youtube.com/watch?v=IhX0fOUYd8Q&t=129s'),
      params: YoutubePlayerParams(
        startAt: Duration(seconds: 129),
        showControls: true,
        showFullscreenButton: true,
      )
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Step 1"),
        backgroundColor: Color(0xff66c290),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: SingleChildScrollView(
            child: Column(

              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Text(
                    'Things to Know Before Starting to Build Your PC',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 17),
                  child: Text(
                    'So you decided you want to build your first computer. Congratulations!\n\nBuilding a PC, while intimidating, can be a fun process! Before you build your computer, however, there are somethings to keep in mind before you begin building yr PC.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: Text(
                    'This might seem obvious, but make sure you have all the parts necessary to build your computer. The main parts you will need for your computer are as follows:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: Text(
                    'List of Parts',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Text(
                    '• CPU\n• GPU\n• Random access memory sticks (RAM)\n• Power Supply Unit (PSU)\n• CPU Cooling Solution (CPU fan/water cooling)\n• Motherboard\n• Storage device (hard drive, solid state drive, floppy disk...)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),

                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Text(
                    'The parts listed above are critical to making a functioning computer. If you are missing any of the listed parts above, you will not be able to  boot into your computer, so please make sure to have all parts on standby and ready to go!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: Text(
                    'As for tools needed to build a PC, have a handy cross-head screwdriver ready, zip ties, and scissors to cut some zip ties. That is it!\n\n'
                        'All the PC parts use the same screwdriver head, so no need to carry anything else.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: Text(
                    'Also, make sure you have set a whole day dedicated to assembling your computer together! There are a lot of steps involved and mistakes can easily be made. Setting a day to build your computer will prevent errors from happening to your build that might affect it!',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: Text(
                    'Visual Guide detailing parts needed below below (timestamp: 2:09)',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: YoutubePlayerIFrame(
                    controller: _controller,
                    aspectRatio: 16/9,
                  )
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
