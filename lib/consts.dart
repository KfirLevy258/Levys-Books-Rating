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
const double verticalPadding = 20;
const double horizontalPadding = 40;
const double smallScreenMinSize = 1150;
const double defaultElevation = 10;
const int maxBooksInRow = 2;
const int numberOfRandomBooks = 10;
const List<Color> ratingColors = [Colors.white, Colors.red, Colors.orange, Colors.yellow, Colors.greenAccent, Colors.green];
String tempGetImageAsset(String rating) {return "assets/rating/" + rating + ".png";}
String notFoundText = "Oops! We cant find the book you searching\nCheck that the book name is written correctly";
double notFoundTextSizeLargeScreen = 40;
double notFoundTextSizeSmallScreen = 30;

// AppBar
const String websiteTitle = "Ran's Books Rating";
const double websiteTitleFontSize = 35;
const double widthOfSearchBoxSmallNavBar = 320;
const double heightOfSearchBox = 40;
const double heightOfLargeAppbar = 85;
const double heightOfSmallAppbar = 120;
const FontWeight appbarTitleFontWeight = FontWeight.bold;
const EdgeInsets defaultPadding = EdgeInsets.all(10);
double paddingSearchAndTile (double width) {return width/15;}
double widthOfSearchBoxLargeNavBar (double width) {return width/2.5;}

// BookCardGeneral
const double cardBorderRadius = 15;
const double ratingCircleSizeDefault = 50;
const double bookDataFontSize = 13;
const double cardRatingScalePadding = 20;
const double ratingScaleHeight = 10;
double ratingCirclePaddingFromLeft(double width, int rating) {return (width / 5) * (rating - 1) + (width / (ratingCircleSizeDefault / 2));} // Return the padding value from the left side of the rating bar
double ratingCircleSize(double width, Function cardDataWidth) {print(cardDataWidth(width)/8); return width > 1600 ? 45 : cardDataWidth(width)/8;} // Return the size of the RatingCircle in ratio the screen size
double ratingCirclePaddingFromTop(double width, Function ratingCircleSize, Function cardDataWidth) {return (ratingCircleSizeDefault - ratingCircleSize(width, cardDataWidth))/2.25;} // Return the padding value from the top side of the rating bar

// BookCard LargeScreen
const double heightOfCardLargeScreen = 410;
const double cardRowHeightLargeScreen = 350;
double cardDataHeightLargeScreen(double width) {return width > 1600 ? 175 : 200;}
double widthOfCardLargeScreen(double width) {return width/2.2;}
double cardImageWidthLargeScreen(double width) {return 230;}
double cardTitleHeightLargeScreen(double width) {return width > 1600 ? 40 : cardDataWidthLargeScreen(width)/8.5;}
double cardSubTitleHeightLargeScreen(double width) {return cardDataWidthLargeScreen(width)/15;}
double cardDataWidthLargeScreen(double width) {return widthOfCardLargeScreen(width) - cardImageWidthLargeScreen(width) - 80;}

// BookCard SmallScreen
const double heightOfCardSmallScreen = 300;
const double cardRowHeightSmallScreen = 250;
const double cardDataHeightSmallScreen = 100;
double widthOfCardSmallScreen(double width) {return width > 750 ? 600 : width-(width/5);}
double cardImageWidthSmallScreen(double width) {return 165;}
double cardTitleHeightSmallScreen(double width) {return cardDataWidthSmallScreen(width)/10;}
double cardSubTitleHeightSmallScreen(double width) {return cardDataWidthSmallScreen(width)/15;}
double cardDataWidthSmallScreen(double width) {return widthOfCardSmallScreen(width) - cardImageWidthSmallScreen(width) - 80;}

// HelpDialog
const String helpDialogTitle = "About Our Rating System";
const String helpDialogButtonText = "OK";
const double helpDialogBorderRadiusSize = 30;
const double helpDialogTitleSize = 40;
const double helpDialogDefaultLineHeight = 3;
const double helpDialogPaddingFromSideBigLine = 2;
const double helpDialogPaddingFromSideSmallLine = 5;
const double helpDialogPaddingFromLines = 7.5;
const double helpDialogButtonWidth = 100;
const double helpDialogButtonSize = 20;
const double helpDialogRatingWidgetHeight = 70;
const double helpDialogRatingWidgetWidth = 500;
const double helpDialogCirclePadding = 22;
const double helpDialogCircleSize = 70;
const double helpDialogTextHeight = 60;
const double helpDialogTextSize = 12;
double helpDialogWidth(double width) {return width/2.5;}
double helpDialogTextWidth(double width) {return helpDialogWidth(width) - 200;}
double helpDialogHeight(double height) {return height;}

// AddBookScreen
const String addBookTitle = "Manager log in";
const String addBookUploadImageText = "Upload book image";
const String addBookSubmitButtonTitle = "Submit";
const EdgeInsets addBookPadding = EdgeInsets.all(7);
double addBookWidgetsWidth(double width) {return width/5;}

// FormWidgets
const double formWidgetsTitleSize = 24;
const EdgeInsets formWidgetsPadding = EdgeInsets.all(5);

// ErrorPage
const double bigTextSizeErrorPage = 60;
const double smallTextSizeErrorPage = 24;
const String bigTextErrorPage = "404 Error - Page not found";
const String smallTextErrorPage = "Please try to reload this page. If the problem not solved,\n check your connection to the internet :)";
double getErrorPagePadding(double height) {return height / 8;}

// LoadingBooks
const String loadingFile = "assets/Loading.gif";
const double loadingSize = 100;
const EdgeInsets loadingPadding = EdgeInsets.all(120);

// InfoDialog
const double infoDialogWidth = 300;
const double infoDialogHeight = 200;

// Database
const String databaseBooksCollection = "books";
const String databaseAssetsCollection = "assets";
const String databaseBookName = "name";
const String databaseBookAuthor = "author";
const String databaseBookYear = "publishing_year";
const String databaseBookData = "book_data";
const String databaseBookImage = "image";
const String databaseBookLanguage = "language";
const String databaseBookRating = "rating";
const String databaseAssetsImage = "image";
const String databaseAssetsText = "text";
