import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:levys_books_rating/screen_params.dart';
import 'book_card_widget.dart';
import 'consts.dart';
import 'database_handling.dart';
import 'nav_bar_functions.dart';

class LargeScreen extends StatefulWidget {
  const LargeScreen({ Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LargeScreenState();
  }
}

class _LargeScreenState extends State<LargeScreen> {
  late ScreenParams screenParams;

  @override
  void initState() {
    screenParams = ScreenParams(
        getRandomBooks(numberOfRandomBooks),
      [loadingBooks()],
      true,
      TextEditingController(),
      convertBooksListToWidgets
    );
    setState(() {
      convertBooksListToWidgets();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              color: Theme.of(context).primaryColor,
              child: navBar(context)
          ),
          SizedBox(
            width: MediaQuery. of(context). size. width,
            height: MediaQuery. of(context). size. height - heightOfLargeAppbar,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: screenParams.listOfBooksWidgets
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget navBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
      child: Container(
        color: Theme.of(context).primaryColor,
        constraints: const BoxConstraints(maxWidth: 10000, maxHeight: heightOfLargeAppbar),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titleAppbar(),
            searchBox(context, screenParams.searchController, widthOfSearchBoxLargeNavBar(MediaQuery. of(context). size. width), screenParams, setStateForOtherFunctions),
            actionButtons(context)
          ],
        ),
      ),
    );
  }

  convertBooksListToWidgets() {
    screenParams.listOfBooks.then((docs) {
      setState(() {
        screenParams.listOfBooksWidgets = [];
        if (docs.isEmpty) {
          screenParams.listOfBooksWidgets.add(
              Column(
                children: [
                  const Padding(padding: loadingPadding),
                  Text(
                    notFoundText,
                    style: TextStyle(
                        fontSize: notFoundTextSizeLargeScreen
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              )
          );
        }
        for (int index = 0; index < docs.length; index = index + maxBooksInRow) {
          List<BookCard> booksInRow = [];
          for (int col = 0; col < maxBooksInRow; col++) {
            if (index + col < docs.length) {
              booksInRow.add(BookCard(
                  largeScreen: screenParams.largeScreen, book: docs[index + col]));
            }
          }
          screenParams.listOfBooksWidgets.add(Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: booksInRow,
          ));
        }
      });
    });
  }

  void setStateForOtherFunctions() {
    setState(() {});
  }
}

