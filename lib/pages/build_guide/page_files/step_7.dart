import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Step7_Page extends StatefulWidget {
  Step7_Page({Key key}) : super(key: key);

  @override
  _Step7_PageState createState() => _Step7_PageState();
}

class _Step7_PageState extends State<Step7_Page> {
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
                      'Installing Optional Devices',
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
                      'This step is only necessary if you bought another PCIE device that is not a GPU.'
                          'If you do not have any optional devices, skip to step 8.\n\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Text(
                      'Graphics cards aren’t the only components that use PCIe slots. '
                          'Other add-in cards include wireless networking, sound, video capture, and even storage. '
                          'Their installation is no different than adding a discrete GPU.\n\n'
                      'First, remove the metal bracket in the back of the case that corresponds with the PCIe or other expansion slot playing host to your add-in card. '
                          'Keep the bracket screw handy so you can use it to secure your new card.\n\n'
                          'PCIe slots have a small switch at the interior end, which you push down and outward to open the slot. '
                          'After that, line up the row of contacts on the card with the slot and firmly push down. '
                          'Once you properly seat the card, the switch flips up. Securing the card in place is as simple as screwing it into the back of the case and attaching any necessary PCIe ports.'
                          'There are a few different types of PCIe slots. '
                          'Many expansion cards use the “PCIe 4x” slot, which is much shorter than the full PCIe slot used by video cards. A quick check of your motherboard’s connectivity, and the size of the connector on your card, will make it obvious which slot is appropriate. '
                          'If in doubt, refer to the expansion card’s manual.',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
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
