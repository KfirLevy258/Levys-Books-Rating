import 'package:flutter/material.dart';
import 'package:levys_books_rating/screen_params.dart';
import 'add_book_screen.dart';
import 'consts.dart';
import 'database_handling.dart';
import 'help_dialog.dart';
import 'dart:html' as html;

Widget titleAppbar() {
  return MaterialButton(
    child: const Text(
      websiteTitle,
      style: TextStyle(
          fontWeight: appbarTitleFontWeight,
          fontSize: websiteTitleFontSize,
          color: Colors.white
      ),
      textAlign: TextAlign.center,
    ),
    onPressed: () {
      html.window.location.reload();
    },
  );
}

Row loadingBooks() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          const Padding(padding: loadingPadding),
          Image.asset(
            loadingFile,
            height: loadingSize,
            width: loadingSize,
          )
        ],
      ),
    ],
  );
}

Widget searchBox(BuildContext context, TextEditingController _searchController, double width, ScreenParams screenParams, VoidCallback setState) {
  return Container(
    width: width,
    height: heightOfSearchBox,
    decoration: BoxDecoration(color: primaryColorMaterial.shade50),
    child: Center(
      child: TextField(
        controller: _searchController,
        onSubmitted: (String searchValue) {
          searchBook(screenParams, setState);
        },
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              searchBook(screenParams, setState);
            },
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
            },
          ),
          hintText: 'Search book name',
          border: InputBorder.none,
        ),
      ),
    ),
  );

}

Widget actionButtons(BuildContext context) {
  return Row(
    children: [
      MaterialButton(
        shape: const CircleBorder(),
        child: Icon(
          Icons.help,
          color: Theme.of(context).dialogBackgroundColor,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return const HelpDialog();
            },
          );
        },
        onLongPress: () {
          // Navigator.push(context, AddBookScreen());
          print("Lol"); // TODO: make admin screen
        },
      ),
      MaterialButton(
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          color: Theme.of(context).dialogBackgroundColor,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddBookScreen()),
          );
        },
      )
    ],
  );
}

searchBook(ScreenParams screenParams, VoidCallback setState) {
  screenParams.listOfBooks = getBooksByName(screenParams.searchController.value.text);
  screenParams.listOfBooksWidgets = [loadingBooks()];
  screenParams.convertBooksListToWidgets();
  setState();
}

