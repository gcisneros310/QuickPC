
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_pc/models/review_data.dart';
import 'package:quick_pc/models/users.dart';
import 'package:quick_pc/pages/part_review/Create_Star.dart';
import 'package:quick_pc/pages/part_review/review.dart';
import 'package:quick_pc/pages/part_review/star.dart';
import 'package:quick_pc/pages/part_review/write_review.dart';
import 'package:quick_pc/shared/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewlistWidget extends StatefulWidget {
  final String partName;
  ReviewlistWidget({Key key, @required this.partName}) : super(key: key);

  @override
  _ReviewlistWidgetState createState() => _ReviewlistWidgetState();
}

class _ReviewlistWidgetState extends State<ReviewlistWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final fb = FirebaseDatabase.instance;
  final Color logoColor = Color(0xff66c290);

  Review_Data new_review = Review_Data();
  void _awaitReview(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReviewWidget(partName: widget.partName))
    );
    setState(() {
      new_review = result;
    });

  }

  Future<List<Review_Data>> getUserReviews() async {
    List<Review_Data> temp_reviews = [];
    await fb
        .reference()
        .child("reviews")
        .child(widget.partName.hashCode.toString())
        .orderByKey()
        .once().then((result) async {
      if (result.value != null) {
        result.value.forEach((key, childSnapshot) {
          temp_reviews.add(Review_Data.fromJson(Map.from(childSnapshot)));
        });
      } else {
        print("get didn't work for reviews");
      }
    }).catchError((e) {
      print("error on reviews: $e");
    });

    return temp_reviews;
  }

  @override
  Widget build(BuildContext context) {

    /*
    List<Review_Data> temp_reviews = [
      Review_Data(partName: "12G-P5-3657-KB", reviewTitle:  "This is expensive", review: "Coming from a 1660 Super, this card completely "
          "runs all my games at Max settings and kills 1080p gaming. Got it with BB's in-store drop and offers awesome price to "
          "performance for EVGA GPUs.", partRating: 5, userid: PCUser())
    ];
    */

    final ref = fb.reference();

    return FutureBuilder(
        future: getUserReviews(),
        builder: (context, projectSnap) {
          if (projectSnap.connectionState == ConnectionState.none &&
              projectSnap.hasData == null && projectSnap.data == null) {
            //print('project snapshot data is: ${projectSnap.data}');
            return Loading();
          }
          if (projectSnap.data == null) {
            print("IF PROJECTSNAP.HASDATA");
            print(projectSnap.data.runtimeType);
            return Loading();
          }
          else {
            return Scaffold(
              backgroundColor: Color(0xFFF5F5F5),
              appBar: AppBar(
                backgroundColor: logoColor,
                title: Text("Reviews"),
                centerTitle: true,
                elevation: 0,
              ),
              body: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: projectSnap.data.length,
                  itemBuilder: (context, index) {
                    return Card(

                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ReviewPageWidget(
                                          review: projectSnap.data[index]
                                              .review,
                                          review_title:
                                          projectSnap.data[index].reviewTitle,
                                          partRating: projectSnap.data[index]
                                              .partRating),
                                ));
                          },
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  projectSnap.data[index].reviewTitle,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                subtitle: Text(
                                  projectSnap.data[index].review,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 8, 8),
                                    child: Row(
                                        children: <Widget>[
                                          StarRating(
                                              rating: projectSnap.data[index]
                                                  .partRating)
                                        ]
                                    )
                                ),
                              ),
                            ],
                          )
                      ),
                      color: Color(0xFFF5F5F5),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                    );
                  }
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () {
                  _awaitReview(context);
                },
                icon: Icon(Icons.arrow_forward),
                label: const Text(
                  "Write a Review",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                backgroundColor: logoColor,
              ),
            );
          }
        }
    );
  }
}
