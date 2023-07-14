import 'package:flutter/material.dart';

const Color bluishClr = Color(0xff4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
Color darkHeaderClr = Color(0xff424242);

class Themes {
  static final light = ThemeData(
    primaryColor: primaryClr,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
  );
  static final dark = ThemeData(
      primaryColor: darkGreyClr,
      brightness: Brightness.dark,
      backgroundColor: darkGreyClr);
}