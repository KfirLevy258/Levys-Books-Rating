import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Colors:
const int primaryColorHex = 0xFF2d6ef0;
const MaterialColor primaryColorMaterial = MaterialColor(
  primaryColorHex,
  <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(primaryColorHex),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  },
);

// General
const String fontFamily = "Rubik";

// AppBar
const String websiteTitle = "Levy's Books Rating";
const String appbarTitleFont = "Rubik";
const FontWeight appbarTitleFontWeight = FontWeight.bold;
double paddingSearchAndTile (double width) {return width/15;}
double widthOfSearchBox (double width) {return width/3;}
const double heightOfSearchBox = 40;
const double heightOfAppbar = 85;
