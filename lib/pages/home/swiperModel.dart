import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';

class SwiperModel{
  String image;

  SwiperModel(this.image);
}

List<SwiperModel> swiperModel = pcImagesData.map((item) => SwiperModel(item['image'])).toList();

var pcImagesData = [
  {"images": "assets/images/nvme mounting area.png"},
  {"images": "assets/amdryzen.jpg"},
  {"images": "assets/amdryzen.jpg"},
];

const colorBlack = Color(0xFF777A95);
const colorGreen = Color(0xFF129A7F);
const colorBlue = Color(0xFF5554DB);
const colorOrange = Color(0xFFFFA873);
const colorPurple = Color(0xFFA079EC);
const colorGrey = Color(0xFFF7F7F7);
const colorGrey2 = Color(0xFFEEEEF0);

var kTitleStyle = GoogleFonts.exo2(
  color: colorBlack,
  fontSize: 18,
  fontWeight: FontWeight.w600,
);
