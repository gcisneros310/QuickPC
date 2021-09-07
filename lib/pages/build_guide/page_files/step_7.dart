import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Step7_PSU extends StatefulWidget {
  Step7_PSU({Key key}) : super(key: key);

  @override
  _Step7_PSUState createState() => _Step7_PSUState();
}

class _Step7_PSUState extends State<Step7_PSU> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayerController.convertUrlToId('https://www.youtube.com/watch?v=k6ppxsRfZMA&t=833s'),
      params: YoutubePlayerParams(
        startAt: Duration(seconds: 833),
        showControls: true,
        showFullscreenButton: true,
      )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Step 7"),
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
                      'Installing your Power Supply Unit (PSU)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Text(
                      'The first component to make its way into the case should be the power supply (PSU). It is typically located at the rear of the case, usually in the bottom or top corner.\n\nWhen in doubt, the slot is easily located by searching for a square opening with screw holes in at least two corners. The PSU sits in this opening with its power switch and a female socket facing out from the case’s back panel. Consult your case’s manual if you have trouble finding the proper location.\n\nYou can install the power supply with the fan facing up or down. In most computer cases, pointing the fan down is ideal. All you need to do is look at your case. If there’s space between the bottom and floor (and preferably a dust filter in between), install your power supply with the fan facing down. Most modern cases are built for this type of installation. If your case manual says something different, however, we recommend following that.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      'Types of PSUs',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Text(
                    'There are two main power supply variants: Standard and modular. There’s a hybrid semi-modular type too, but we don’t need to worry about that for now.\n\nModular PSUs have cables that detach from the main unit to avoid clutter. They’re ideal for smaller cases and neat freaks. If you have a modular PSU, it’s best to leave the cables out for now and run them as you install each additional component.\n\nIf the PSU’s cables don’t detach, carefully bundle them so they’re hanging out the case’s open side panel. This temporarily keeps them out of the way while we install the remaining components.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                      child: YoutubePlayerIFrame(
                        controller: _controller,
                        aspectRatio: 16/9,
                      )



                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
