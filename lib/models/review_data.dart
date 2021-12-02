
import 'package:quick_pc/models/users.dart';
import 'package:quick_pc/pages/part_review/Create_Star.dart';
import 'package:quick_pc/pages/part_review/star.dart';
import 'package:quick_pc/pages/welcome.dart';


class Review_Data {
  String partName;
  String reviewTitle;
  String review;
  double partRating;
  String userid;

  Review_Data({this.partName, this.reviewTitle, this.review, this.partRating, this.userid});


  factory Review_Data.fromJson(Map<String, dynamic> json)=> Review_Data(
    partName: json["part name"],
    reviewTitle: json["review title"],
    review: json["review"],
    partRating: json["part rating"]  == null ? 0.0 : json['part rating'].toDouble(),
    userid: json["user id"],
  );

  Map<String, dynamic> toJson() => {
  "part name": partName,
  "review title": reviewTitle,
  "review": review,
  "part rating": partRating,
  "user id": userid,
  };
}