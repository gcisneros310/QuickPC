import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Step9_Page extends StatefulWidget {
  Step9_Page({Key key}) : super(key: key);

  @override
  _Step9_PageState createState() => _Step9_PageState();
}

class _Step9_PageState extends State<Step9_Page> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Step 8"),
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
            padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Text(
                      'Installing Storage Devices',
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
                      'Before you get too excited and hit that power button, it’s worth running back through the system to make sure everything is properly seated and connected. '
                          'Let’s start with the main components.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Text(
                      'The motherboard is usually easy to spot if it isn’t plugged in. '
                          'Most PSUs have one wide cable that’s obviously intended for this slot, with no other connections attached. '
                          'It should plug into your board somewhere near the PCIe slots, but the location will vary.\n\n'
                          'Your motherboard is also likely to have a second, four-pin (or eight-pin) connector that powers the processor. '
                          'You may need to look through your power supply’s available connectors with a keen eye to find it given it resembles a PCIe power connector. '
                          'But don’t worry — a PCIe connector won’t fit, so improper installation isn’t possible.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Image(
                        image: AssetImage('assets/images/psu connectors.jpg'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Ensure all PSU connectors are placed in the correct power sockets.',
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
                        image: AssetImage('assets/images/man plugging cables.jpg'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Ensure all case connectors are inserted in the correct locations!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Text(
                      'The CPU cooler also needs power, but that flows from the motherboard. Its power cable doesn’t need to go far, as most motherboards keep the plug close to the socket. '
                          'The little wire is just three or four sockets and connects to a set of four pins on the motherboard.'
                          'The hard drives need power too in the form of L-shaped SATA connectors (unless it’s a PCIe drive). Typically, a string of three or four lines run straight from the power supply using unique connectors. '
                          'You can’t install them the wrong way, either.'
                          'Finally, high-powered graphics cards need dedicated power connections, usually in the form of a black rectangular connector with six or eight pins. Some cards, like the recent RTX 3080, even require two eight pin connections. '
                          'These plugs are brightly colored and easy to spot and only fit in the interior end of the card in one orientation. '
                          'If they aren’t plugged in, the fans on the card won’t spin, and it won’t produce any video output.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Image(
                        image: AssetImage('assets/images/SATA connectors.jpg'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'For 3.5in HDDs and 2.5in SSDs, ensure that both SATA power and data cords are connected.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
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
