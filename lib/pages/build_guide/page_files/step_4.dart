import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Step4_Page extends StatefulWidget {
  Step4_Page({Key key}) : super(key: key);

  @override
  _Step4_PageState createState() => _Step4_PageState();
}

class _Step4_PageState extends State<Step4_Page> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayerController.convertUrlToId('https://youtu.be/raXX4u862g8?t=222'),
      params: YoutubePlayerParams(
        startAt: Duration(seconds: 221),
        showControls: true,
        showFullscreenButton: true,
      )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF66C290),
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Installing the Motherboard',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Text(
                      'NOTE: Some CPU coolers are easier to install when the motherboard is not yet installed in the PC case.\n'
                          'Generally speaking, air-cooling solutions are easier to install on the motherboard before installing the motherboard to the PC case. Water cooling solutions are the opposite.\n'
                          'If that is the case, skip to Step 5, then come back to Step 4.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                    child: Text(
                      'Installing your packed motherboard is easy enough, but it can’t just sit in your case. '
                          'Most modern cases have built-in, non-removable spacers between the back wall and motherboard, known as standoffs. '
                          'They act as a ground for the motherboard while preventing the connections on the back from shorting.\n\n'
                          'Some cases have removable stand-offs you must manually install. They’re easy to identify because they look unusual — essentially screws that have another screw hole on top instead of the typical screwdriver notch. They’re usually copper or gold in color, making them easy to pick out.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Image(
                        image: AssetImage('assets/images/motherboard_standoff_locations.png'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Motherboard standoff locations\n\n'
                          'Note: Your motherboard might have a slightly different standoff layout.\n'
                          'Fortunately, case standoffs for motherboards can be easily moved to different standoff locations based on your case.\n'
                          'Please check your case and adjust the standoffs appropriately',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Your motherboard’s orientation depends on your case. At the back or the top, you’ll see a rectangular cut-out. This is for the motherboard’s I/O panel — the portion containing the USB, video, and Ethernet connections. Your motherboard ships with an I/O shield that fits into this rectangular cut-out. If you install that shield and then align your motherboard’s I/O panel, you should see the motherboard’s screw holes align with the stand-offs in your case.\n\nIf not, you may need to wiggle the motherboard slightly to make sure it snaps properly into the I/O shield and the stands-offs align. This may require some effort, but it shouldn’t require much force. If you’re forcing the motherboard, double-check how it’s aligned, as it may not be properly positioned. Be firm but gentle.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Depending on the case and motherboard combination, pairing the two requires between six and 10 screws. You may find that not all holes match up with standoffs underneath. Drop a screw into a hole to see if it threads right away.\n\nLike every set of screws, the first step is seating the screws and giving them a couple of precursory turns. Then, proceed in a star pattern, tightening each screw a little at a time. Don’t go wild while tightening as you might damage the board. You only need enough torque to hold the board in place without wiggling.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Once the motherboard seats comfortably in the case, there are a few necessary connections:\n\n'
                          '1.  The motherboard’s power connection is a wide, two-row cable that fits snugly into a similar looking spot on the board itself. This 20-28 pin connector powers both the motherboard and the CPU. '
                          'However, some boards have a second 4-pin or 8-pin connector for the processor, which resides near your CPU, typically in the top corner. If you have it, you’ll need to plug that in, too.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Image(
                      image: AssetImage('assets/images/power-supply-to-motherboard-diagram.jpg'),
                    )
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Yellow Arrow: 8-pin CPU power connector connector\nRed Arrow: Motherboard power connector',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      '2.  Connect the case plugs and buttons to the motherboard. A double-wide row of pins — the location of which will be noted in your manual — runs the USB ports, buttons for reset and power, and activity LEDs for power and storage.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Image(
                        image: AssetImage('assets/images/front_panel_connectors.jpg'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Front panel connectors from PC case',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Image(
                        image: AssetImage('assets/images/case_plugs_mobo.jpg'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Case plug connectors on motherboard\nNote: Please refer to your manual for proper instructions for connecting case plugs to motherboard connectors',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'These small cables run in a bundle from wherever the ports reside in the case. Proper installation can be difficult, however, due to their size. If you have a magnifying glass or a set of tweezers, now is a great time to use them. Some motherboards include an adapter that bridges these jumpers to the right connections on your motherboard. Otherwise, installing them is as simple as matching the labels on the pins with the labels on the connections.\n\n'
                          'The USB header connecting to your front-facing motherboard ports will be on its own. This connection is around eight by two pins, and they’re enclosed in a larger plastic housing. This header has a notch on one side that should clearly indicate which direction it plugs in.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Text(
                      'Visual guide (note: timestamp to motherboard installation: 3:41)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                      child: YoutubePlayerIFrame(
                        controller: _controller,
                        aspectRatio: 16/9,
                      )
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
