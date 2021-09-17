import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Step6_Page extends StatefulWidget {
  Step6_Page({Key key}) : super(key: key);

  @override
  _Step6_PageState createState() => _Step6_PageState();
}

class _Step6_PageState extends State<Step6_Page> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayerController.convertUrlToId('https://www.youtube.com/watch?v=YVbjl69z3HE'),
      params: YoutubePlayerParams(
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
                      'Installing the GPU',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Not every system needs a dedicated graphics card (discrete GPU). If you want a stand-alone chip for graphics, like PC gaming, installation couldn’t be simpler. We’re also assuming for this step that the card you chose is appropriate for your case size, capabilities, and power supply.\n\n'
                          'Modern graphics cards use a PCI-Express (PCIe) x16 slot. It’s a long, thin connector located on the rear of the motherboard, below the processor. For the vast majority of motherboards, you’ll want to use the top PCIe x16 slot.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Image(
                        image: AssetImage('assets/images/PCIE SLOT.png'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Location of PCIE slot\nPut your GPU here!',
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
                      'To seat the card in that slot, you’ll need to remove a rectangular backplate from your enclosure. It’s one of many thin metal brackets lined down the back of the case to keep it sealed up.\n\n'
                          'You’ll need to remove one or two, depending on the card’s width. Do this by removing the screw that secures the backplate to the chassis. Once removed, the plate should slide (or fall) out freely. Keep the screw as you’ll need it in a moment.',

                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Image(
                        image: AssetImage('assets/images/case_brackets.png'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Case brackets behind PC case',
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
                      'After removing the brackets, make sure the switch on the motherboard’s PCIe slot is pushed outward. Then, with the ports facing the empty spot where the backplate used to be, carefully line up the long series of contacts on the card with the appropriate slot on the motherboard. Once it’s lined up properly, a solid push on the top of the card should cause it to snap into place as the switch clicks back in to hold it.\n\n'
                          'You don’t need excessive force, but if you encounter a great deal of resistance, take another look at the backplate and PCIe slot to make sure both are clear and the motherboard is properly aligned. Also take note if there is a push-pin that locks the card in like your memory slots, as some motherboards use it as a safety measure.\n\n'
                          'Use the screws pulled from the metal brackets to fasten the back of the card into the same spot in the case. Again, they don’t need to be extremely tight — just enough to hold the card firmly in place.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Image(
                        image: AssetImage('assets/images/GPU bracket screws.jpg'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Re-use the screws you took off from the brackets to screw the GPU onto the case',
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
                      'Most video cards need extra power apart from what the PCIe slot provides. If your card needs extra juice, you’ll see a PCIe power connector on the card’s side facing away from the motherboard or, in some cases, on the side facing the front of the case. This connector is a group of square plastic pins numbering six or eight.\n\n'
                          'The most powerful cards may have two such connectors. Find the appropriate connector on your power supply, typically labeled VGA, and slot it in. The connector’s design prevents improper installation, so if the connection isn’t easy, double-check your alignment to make sure it’s correct.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Image(
                        image: AssetImage('assets/images/GPU-power-connectors.jpg'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'The GPU power connectors will look something like this. Make sure to connect the SATA power cords to these connectors.',
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
                      'Visual Guide',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold
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
