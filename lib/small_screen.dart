import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:levys_books_rating/screen_params.dart';
import 'book_card_widget.dart';
import 'consts.dart';
import 'database_handling.dart';
import 'nav_bar_functions.dart';

class SmallScreen extends StatefulWidget {
  const SmallScreen({ Key? key }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SmallScreenState();
  }
}

class _SmallScreenState extends State<SmallScreen> {
  late ScreenParams screenParams;

  convertBooksListToWidgets() {
    screenParams.listOfBooks.then((docs) {
      screenParams.listOfBooksWidgets = [];
      setState(() {
        if (docs.isEmpty) {
          screenParams.listOfBooksWidgets.add(
              Column(
                children: [
                  const Padding(padding: loadingPadding),
                  Text(
                    notFoundText,
                    style: TextStyle(
                      fontSize: notFoundTextSizeSmallScreen
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              )
          );
        }
        for (int index=0; index<docs.length; index++) {
          screenParams.listOfBooksWidgets.add(BookCard(largeScreen: screenParams.largeScreen, book: docs[index]));
        }
      });
    });
  }

  @override
  void initState() {
    screenParams = ScreenParams(
      getRandomBooks(numberOfRandomBooks),
      [loadingBooks()],
      false,
      TextEditingController(),
      convertBooksListToWidgets,
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
            child: navBar(context),
          ),
          SizedBox(
            width: MediaQuery. of(context). size. width,
            height: MediaQuery. of(context). size. height - heightOfSmallAppbar - 2 * verticalPadding,
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
        constraints: const BoxConstraints(maxWidth: smallScreenMinSize, maxHeight: heightOfSmallAppbar),
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titleAppbar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                searchBox(context, screenParams.searchController, widthOfSearchBoxSmallNavBar, screenParams, setStateForOtherFunctions),
                actionButtons(context)
              ],
            )
          ],
        ),
      ),
    );
  }

  void setStateForOtherFunctions() {
    setState(() {});
  }

}
