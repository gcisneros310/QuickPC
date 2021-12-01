
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/pages/build_list/build_list.dart';
import 'package:quick_pc/models/review_data.dart';
import 'package:quick_pc/pages/part_review/star.dart';
import 'Create_Star.dart';

class ReviewWidget extends StatefulWidget {
  final String partName;
  ReviewWidget({Key key, @required this.partName}) : super(key: key);


  @override
  _ReviewWidgetState createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  TextEditingController textController1 = new TextEditingController();
  TextEditingController textController2 = new TextEditingController();

  double rating = 5.0;

  Review_Data sample_review = Review_Data();
  final fb = FirebaseDatabase.instance;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  StarRating star;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final ref = fb.reference();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: (Text("Write a Review")),
        backgroundColor: Color(0xFF66C290),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: Text(
                  'Overall Rating',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: Row (

                      children: <Widget>[
                        star = new StarRating(
                          rating: rating,
                          onRatingChanged: (rating) => setState(() => this.rating = rating),
                        )
                        ]
                  )
              ),
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: Text(
                  'Written Review',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: TextFormField(
                  controller: textController1,
                  obscureText: false,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: 'Add a title for your review',
                    filled: true,
                    border: OutlineInputBorder(),
                    fillColor: logoColor,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: GoogleFonts.exo2(color: Colors.black, fontSize: 18)
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: TextFormField(
                controller: textController2,
                obscureText: false,
                  maxLines: 8,
                decoration: InputDecoration(
                  hintText: 'What did you like or dislike about the product?',
                  filled: true,
                  border: OutlineInputBorder(),
                  fillColor: logoColor,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
                style: GoogleFonts.exo2(color: Colors.black, fontSize: 18)
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
              elevation: 0,
              minWidth: double.maxFinite,
              height: 50,
              onPressed: () async{
                sample_review.review = textController2.text.toString();
                print(textController2.text.toString());
                sample_review.reviewTitle = textController1.text.toString();
                print(textController1.text.toString());
                sample_review.partRating = rating;
                sample_review.partName = widget.partName;
                print(widget.partName.hashCode);
                Map<String, dynamic> testmap = sample_review.toJson();
                await ref.child("reviews/").child(widget.partName.hashCode.toString()).push().update(testmap);
                Navigator.of(context).pop();
              },
              color: logoColor,
              child: Text('Submit',
                  style: GoogleFonts.exo2(color: Colors.black, fontSize: 16)),
              textColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }

}
