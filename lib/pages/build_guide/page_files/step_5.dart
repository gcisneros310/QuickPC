import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Step5_PSU extends StatefulWidget {
  Step5_PSU({Key key}) : super(key: key);

  @override
  _Step5_PSUState createState() => _Step5_PSUState();
}

class _Step5_PSUState extends State<Step5_PSU> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  YoutubePlayerController _controller1 = YoutubePlayerController(
      initialVideoId: YoutubePlayerController.convertUrlToId('https://www.youtube.com/watch?v=Sog0M9OrlME'),
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
        title: Text("Step 5"),
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
                      'Installing the CPU Cooler',
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
                      'NOTE: Some CPU coolers are easier to install when the motherboard is not yet installed in the PC case. If that is the case, feel free to follow this step and skip back to Step 4.\n\n'
                          'Also, a visual guide for installing the CPU cooling solution will not be included due to the dozens of different installation methods created by different manufacturers. Please refer to the installation manual of your CPU cooling solution for visual guides.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Text(
                      'With the motherboard now tethered to your case, you can wipe the sweat of concentration off your brow. Now it’s time for the CPU cooler or heat sink!\n\n'
                          'Installation is simpler when using the CPU’s packaged cooler. The process varies, however, given the different brands and generations. You’ll need to refer to the included instructions for specific details. The same is true for third-party coolers, which use a proprietary installation bracket. Following the included instructions is crucial to your PC-building success.\n\n'
                          'Every cooler needs thermal paste. It’s an excellent thermal conductor, allowing heat to transfer from the chip to the cooler with ease. Without it, your cooler won’t work very well, if at all. If you bought a 3rd party cooler, it most likely included thermal paste, either already pre-applied to the cooler or in a seperate tube to apply manually.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                      child: Image(
                        image: AssetImage('assets/images/preappliedpaste.jpg'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Text(
                      'Pre-applied thermal paste application',
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
                      'When directed by the instructions, simply apply a single silver dot — about the size of a small pea — right in the center of the chip. After squishing the chip and cooler together, try not to wiggle or twist too much, to ensure a smooth, full connection. If you’re using your own thermal paste instead of what’s pre-applied, make sure to fully clean the cooler using coffee filters with a little bit of isopropyl alcohol, removing any trace of the previously applied paste.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                      child: Image(
                        image: AssetImage('assets/images/peasize.jpg'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Text(
                      'Pea-sized thermal paste application',
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
                      'Visual thermal paste application guide',
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
                        controller: _controller1,
                        aspectRatio: 16/9,
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Text(
                      'For basic heat sinks, you’re now finished; just wait for the paste to cure. But the full fan system still needs power. Plug the wires from the fan into a four-pin connection on the motherboard, which should be close to the processor and labeled “CPU_FAN.”',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
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
