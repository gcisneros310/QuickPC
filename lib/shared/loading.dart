import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Color logoColor = Color(0xff66C290);
    return Container(
      color: Colors.grey[850],
      child: Center(
        child: SpinKitFadingCube(
          color: logoColor,
          size: 50.0,
        ),
      ),
    );
  }
}