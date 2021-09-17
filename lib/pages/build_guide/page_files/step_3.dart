import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Step3_Page extends StatefulWidget {
  Step3_Page({Key key}) : super(key: key);

  @override
  _Step3_PageState createState() => _Step3_PageState();
}

class _Step3_PageState extends State<Step3_Page> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayerController.convertUrlToId('https://www.youtube.com/watch?v=VA-eGIitpsw'),
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
            padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      'Installing RAM Sticks',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Text(
                      'System memory, or RAM, doesn’t require any careful goo placement or wires. There are just two important factors, assuming you’ve chosen compatible RAM: Direction and slot choice.\n\nThe direction is easy enough. Each memory stick has a notch in the contacts lining the bottom edge that lines up with a block in the motherboard’s memory slots. If you hold it just above the slot and the two line up, it’s facing the right direction. If it doesn’t line up, spin it 180 degrees.\n\nSlot choice depends on a few factors, one of which is how you purchased RAM. If it’s just a single stick, install it in the A1 slot and move on with your life. A diagram in the motherboard’s manual should label the slots if it isn’t printed directly on the PCB.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      'However, you likely purchased two identical RAM sticks, a common package called a dual-channel configuration. The system can use both sticks as if they were a single block of RAM but accesses them individually, providing a modest boost to memory performance.\n\n'
                          'You should install these sticks in channels (slots) with matching colors, usually labeled A1 and B1, though sometimes A2 and B2 are preferable. Check your motherboard’s manual to confirm which are best for your system.\n\n'
                          'Diagram showing general dual channel RAM placement below:',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: Image(
                      image: AssetImage('assets/images/dual_channel.png')
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      'Left: Single Channel RAM configuration\n'
                          'Center: Dual Channel RAM configuration\n'
                          'Right: 4-stick RAM Configuration\n'
                          'NOTE: Some motherboards might have slightly different configurations for dual channel placement. '
                          'Please refer to your motherboard manual for specific diagrams regarding your motherboard.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontStyle: FontStyle.italic,

                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      'Now that we know the proper slot and direction, the next part is easy. Push the plastic wings at either end of the slot down and outward (some motherboards only have one) then place the stick in the slot sticking straight up. Push down firmly until the RAM clicks into the slot, and the plastic wings click back in and clamp the ends of the sticks.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Text(
                      'The instructions listed above are generalized instructions for installing a CPU. Installing a CPU on an Intel motherboard or an AMD motherboard are slightly different. Expand instructions below for specific manufacturer.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
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
