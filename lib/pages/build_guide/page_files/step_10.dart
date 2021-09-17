import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/material.dart';
import 'package:any_link_preview/any_link_preview.dart';

class Step10_Page extends StatefulWidget {
  Step10_Page({Key key}) : super(key: key);

  @override
  _Step10_PageState createState() => _Step10_PageState();
}

class _Step10_PageState extends State<Step10_Page> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayerController.convertUrlToId('https://www.youtube.com/watch?v=k6ppxsRfZMA&t=833s'),
      params: YoutubePlayerParams(
        startAt: Duration(seconds: 833),
        showControls: true,
        showFullscreenButton: true,
      )
  );

  final style = TextStyle(
    color: Colors.red,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.375,
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
                      'Power On Your PC!',
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
                      'Now that you’ve double-checked everything, switch on the power supply and press the power button on the front. '
                          'A lot of systems don’t boot correctly the first time, so don’t get discouraged if you need to go back and check connections again.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Text(
                      'Once it does boot, you’ll need to install an operating system (OS).'
                          'While this guide will not help you install the OS (this guide is solely for building the PC), Microsoft and other companies provide great guides for installing an OS!\n\n'
                          'Links for OS installation instructions:',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: AnyLinkPreview(
                        link: "https://www.microsoft.com/en-us/software-download/windows10%20",
                        displayDirection: UIDirection.UIDirectionHorizontal,
                        showMultimedia: true,
                        bodyMaxLines: 5,
                        bodyTextOverflow: TextOverflow.ellipsis,
                        titleStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
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
