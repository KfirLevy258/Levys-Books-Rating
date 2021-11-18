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
const String websiteTitle = "Ran's Books Rating";
const double websiteTitleFontSize = 35;
const String appbarTitleFont = "Rubik";
const FontWeight appbarTitleFontWeight = FontWeight.bold;
double paddingSearchAndTile (double width) {return width/15;}
double widthOfSearchBoxLargeNavBar (double width) {return width/2.5;}
const double widthOfSearchBoxSmallNavBar = 320;
const double heightOfSearchBox = 40;
const double heightOfLargeAppbar = 90;
const double heightOfSmallAppbar = 120;

// BookCardGeneral
const EdgeInsets cardDefaultPadding = EdgeInsets.all(10);
const double cardBorderRadius = 15;
const double ratingCircleSizeDefault = 50;
const double bookDataFontSize = 12;
double ratingCirclePaddingFromLeft(double width, int rating) {return (width / 5) * (rating - 1) + (width / (ratingCircleSizeDefault / 2));} // Return the padding value from the left side of the rating bar
double ratingCircleSize(double width, Function cardDataWidth) {return cardDataWidth(width)/8;} // Return the size of the RatingCircle in ratio the screen size
double ratingCirclePaddingFromTop(double width, Function ratingCircleSize, Function cardDataWidth) {return (ratingCircleSizeDefault - ratingCircleSize(width, cardDataWidth))/2.25;} // Return the padding value from the top side of the rating bar
const double cardRatingScalePadding = 20;

// BookCard LargeScreen
double widthOfCardLargeScreen(double width) {return width/2.2;}
const double heightOfCardLargeScreen = 410;
const double cardRowHeightLargeScreen = 350;
double cardImageWidthLargeScreen(double width) {return 230;}
double cardTitleHeightLargeScreen(double width) {return cardDataWidthLargeScreen(width)/8.5;}
double cardSubTitleHeightLargeScreen(double width) {return cardDataWidthLargeScreen(width)/15;}
const double cardDataHeightLargeScreen = 200;
double cardDataWidthLargeScreen(double width) {return widthOfCardLargeScreen(width) - cardImageWidthLargeScreen(width) - 80;}

// BookCard SmallScreen
double widthOfCardSmallScreen(double width) {return width > 750 ? 600 : width-(width/5);}
const double heightOfCardSmallScreen = 300;
const double cardRowHeightSmallScreen = 250;
double cardImageWidthSmallScreen(double width) {return 165;}
double cardTitleHeightSmallScreen(double width) {return cardDataWidthSmallScreen(width)/10;}
double cardSubTitleHeightSmallScreen(double width) {return cardDataWidthSmallScreen(width)/15;}
const double cardDataHeightSmallScreen = 100;
double cardDataWidthSmallScreen(double width) {return widthOfCardSmallScreen(width) - cardImageWidthSmallScreen(width) - 80;}

const double verticalPadding = 20;
const double horizontalPadding = 40;

const double ratingScaleHeight = 10;

const double smallScreenMinSize = 1150;

// HelpDialog
double helpDialogWidth(double width) {return width/2.5;}
double helpDialogHeight(double height) {return height/1.2;}