import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpandViewListText {
  ExpandViewListText({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<ExpandViewListText> generateItems(int numberOfItems) {

  var manufacturers = ['Intel', 'AMD'];
  var cpu_image_asset_list = [
    'assets/images/INTEL CPU.jpg',
    'assets/images/AMD CPU.jpg'
  ];
  var instructions = [
    'Instead of jutting from the processor, pins now reside in modern Intel sockets on motherboards, making CPU installation easy. This part of the socket is called the contact array. Absolutely do not bend or touch these pins!\n\nThe square metal bracket holding the CPU in place is the load plate, and it’s raised and lowered using the load lever. When clamped down, the end of the load lever tucks under a hook to keep everything in place. When you unbox your motherboard, the contact array will be covered with a piece of plastic. This plastic will pop out once you open the bracket, so wait to open it until you’re ready to install your processor.\n\nFirst, open the load plate. Do this by gently pushing down on the load arm and moving it out sideways from under the hook, and then raising it up all the way. The hook’s lever action opens the plate, which you can easily flip up. At this point, the plastic piece will come loose. If it doesn’t pop out, gently remove it.\n\nAs shown above, the CPU itself should have a small half-circle notch on each side of the chip. With the contacts facing down, there should be only one direction where the notches line up with the notches in the socket. Pick up your processor by the sides, clamping it lightly between your fingertips. Here, you want to avoid touching the bottom of the processor.\n\nWith the processor in hand, line up the notches (or use the small gold triangle in the corner to line up the socket) and set the processor in. You don’t need to apply any force here. The processor should slot in without issues. Once it’s sitting in the socket, very gently press the side to make sure it’s slotted in. Again, very gently do this. You don’t want to move your processor. You want to make sure it’s in place.\n\nUse the load arm on the side to lower the plate over the chip, then push down and re-clip the arm under the hook once again. This requires a fair amount of pressure, so make sure the chip is properly seated before pressing down.\n\nRemember, the notches in the processor should align with those in the socket. If in doubt, start again and double-check.',
    'Unlike Intel’s design, pins jut from AMD’s CPUs. These pins insert into holes embedded in the motherboard’s CPU socket. The load arm on the socket slightly shifts the holes underneath, gripping the pins on the processor when pressed all the way down.\n\nIf it isn’t already, raise the arm so that it’s pointing straight up, and then rests a little farther back. That ensures the holes for the pins are wide open.',
  ];

  return List.generate(numberOfItems, (int index) {
    return ExpandViewListText(
      headerValue: 'Installing an ' + manufacturers[index] + ' CPU',
      expandedValue: instructions[index],
    );
  });
}

class Step2_Page extends StatefulWidget {
  Step2_Page({Key key}) : super(key: key);

  @override
  _Step2_PageState createState() => _Step2_PageState();
}

class _Step2_PageState extends State<Step2_Page> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<ExpandViewListText> exp = generateItems(2);
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
                      'Installing the CPU',
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
                      'Next, prepare the motherboard by installing the CPU and RAM before fitting it in the case. They’re a lot easier to install now rather than after the motherboard resides in the system.\n\nInstalling the CPU might be the most stressful part of building your PC, but do not fear! It is straightforward and easy to install if you take the time to do it properly!',
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
                      'Basic Installation Procedure',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Text(
                      'Carefully remove the motherboard from its anti-static bag and set it on a hard, flat, non-metal surface such as a wooden desk, or the top of the motherboard box itself. Also, make sure there are no sources of dust or liquid nearby.\n\n'
                          'Even though installing a CPU is an easier task now than it was in previous years, it’s still one of the most precarious. There are numerous pins on the CPU and motherboard, and bending any one of them could render that component kaput.\n\n'
                          'That said, the process isn’t designed to be difficult, and as long as you follow the instructions clearly and keep an eye out to ensure the chip is fully seated before you clamp it in place, you’ll be fine. However, there are some subtle differences in the process depending on who made your CPU.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Image(
                        image: AssetImage('assets/images/PLACING CPU.gif'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Placing a CPU into the socket',
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
                        image: AssetImage('assets/images/AMD CPU.jpg'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'AMD CPU (pins on the bottom)',
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
                        image: AssetImage('assets/images/INTEL CPU.jpg'),
                      )
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Intel CPU (pinless)',
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
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Text(
                      'Visual Instructions Below',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,  physics: ClampingScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return ExpansionPanelList(
                          expansionCallback: (int index, bool isExpanded) {
                            setState(() {
                              exp[index].isExpanded = !isExpanded;
                            });
                          },
                          animationDuration: Duration(milliseconds: 200),
                          dividerColor: Colors.grey,
                          elevation: 2,
                          children: exp.map<ExpansionPanel>((ExpandViewListText item) {
                            return ExpansionPanel(
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  title: Text(
                                      item.headerValue,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400
                                    ),
                                  ),
                                );
                              },
                              body: ListTile(
                                title: Text(
                                    item.expandedValue,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),
                              isExpanded: item.isExpanded,
                            );
                          }).toList(),
                        );
                      },
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
