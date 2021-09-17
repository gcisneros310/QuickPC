import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Step8_Page extends StatefulWidget {
  Step8_Page({Key key}) : super(key: key);

  @override
  _Step8_PageState createState() => _Step8_PageState();
}

class _Step8_PageState extends State<Step8_Page> {
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
                      'There are three different storage drive sizes you’re likely to encounter, and they all mount and connect differently. '
                          'Generally, hard disk drives (HDD) are the larger 3.5-inch size, while newer solid-state drives (SSD) adopt the smaller 2.5-inch size. '
                          'There’s also the even smaller M.2 format and PCI-Express drive format, which tend to be thin sticks with bare chips measuring around 1 x 3 inches.',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Image(
                        image: AssetImage('assets/images/3.5 hdd.JPG'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      '3.5 inch HDD (the big fat one)',
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
                        image: AssetImage('assets/images/2.5 ssd.jpg'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      '2.5 inch solid state drive (the thinner one)',
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
                        image: AssetImage('assets/images/nvme ssd.jpg'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'NVME solid state drive (the skinny boi)',
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
                      '3.5-inch data drives  are usually mounted up high at the front of the system. '
                          'Your case is almost guaranteed to have at least one slot dedicated to this drive type. '
                          'Installation depends on the enclosure, however, as most cases have a simple hard drive cage. '
                          'Installing a drive means slotting it into a mount on the cage and aligning the screw holes on the drive’s sides with those on the cage. '
                          'Make sure the drive’s power and data connectors face inwards, toward the motherboard. Once aligned, screw the drive into place.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Text(
                      'Modern cases quite commonly enjoy a “tool-less” installation system. '
                          'As the term implies, this design should mean it’s possible to install the drive without a screwdriver. '
                          'Usually, this means placing the drive into a cradle or cage that slots into the case. '
                          'Refer to your enclosure’s instructions for specifics, since the technique varies from one brand to the next.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Image(
                        image: AssetImage('assets/images/hdd mount bay.jpg'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Standard PC HDD mounting bay.\n'
                          'NOTE: Your case may have a slightly different layout for the HDD mounting bay. '
                          'Please refer to your case manual for specific instructions.',
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
                      'For 2.5-inch drives, the mounting process and location vary. '
                          'Some cases have a cage, similar to the 3.5-inch mounting, where the SSD can just slide in — no rivets, screws or brackets needed. '
                          'If it doesn’t, the SSD requires an adapter so it can sit securely in a 3.5-inch bay.\n'
                          'You can mount this drive in one of two ways. '
                          'Either the larger bracket provides holes inside so you can screw the drive into the middle, or the case includes a bracket that adds extra girth to the 2.5-inch drive.'
                          '',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Text(
                      'Hard drives require two connections as well: One for power and one for data. '
                          'The good news is that both are L-shaped, so it’s hard to plug them in the wrong slot or the wrong direction.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Text(
                      'For those with a newer M.2 drive, you’ll want to look for a small slot that matches the width of your stick-shaped drive, and a screw located a few inches away. '
                          'Remove the screw, insert the contact end into the slot, and then push down gently until you can use the screw to hold the drive in place once.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Image(
                        image: AssetImage('assets/images/nvme mounting area.png'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'If your motherboard supports NVME SSDs, the area to install them will look like this near where you install the GPU.',
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
