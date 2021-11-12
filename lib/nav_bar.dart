import 'package:flutter/material.dart';
import 'consts.dart';

class LargeNavBar extends StatelessWidget {
  LargeNavBar({ Key? key }) : super(key: key);

  final TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
      child: Container(
          color: Theme.of(context).primaryColor,
          constraints: const BoxConstraints(maxWidth: 10000, maxHeight: heightOfLargeAppbar),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titleAppbar(),
            searchBox(context, _searchController, widthOfSearchBoxLargeNavBar(MediaQuery. of(context). size. width)),
            actionButtons(context)
          ],
        ),
      ),
    );
  }
}

class SmallNavBar extends StatelessWidget {
  SmallNavBar({ Key? key }) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                searchBox(context, _searchController, widthOfSearchBoxSmallNavBar),
                actionButtons(context)
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget titleAppbar() {
  return MaterialButton(
    child: const Text(
      websiteTitle,
      style: TextStyle(
          fontWeight: appbarTitleFontWeight,
          fontSize: 35, // TODO: change to const
          color: Colors.white
      ),
      textAlign: TextAlign.right,
    ),
    onPressed: () {

    },
  );
}

Widget searchBox(BuildContext context, TextEditingController _searchController, double width) {
  return Container(
    width: width,
    height: heightOfSearchBox,
    decoration: BoxDecoration(color: primaryColorMaterial.shade50),
    child: Center(
      child: TextField(
        controller: _searchController,
        onSubmitted: (String searchValue) {
          searchBookSearch(searchValue);
        },
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              searchBookSearch(_searchController.value.text);
            },
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
            },
          ),
          hintText: 'Search book name', // TODO: Change to const
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
          print("I need helppppp!"); // TODO: make a help
        },
        onLongPress: () {
          print("Lol"); // TODO: make admin screen
        },
      ),
    ],
  );
}

void searchBookSearch(String bookName) {
  print(bookName);
}