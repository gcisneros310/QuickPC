import 'package:flutter/cupertino.dart';
import 'package:quick_pc/pages/part_review/star.dart';

class CreateStar extends StatefulWidget {
  @override
  _CreateStarState createState() => new _CreateStarState();
}

class _CreateStarState extends State<CreateStar> {
  double rating = 5.0;
  @override
  Widget build(BuildContext context) {
    return new StarRating(
      rating: rating,
      onRatingChanged: (rating) => setState(() => this.rating = rating),
    );
  }
}