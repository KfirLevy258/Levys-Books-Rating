import 'package:flutter/material.dart';
import 'consts.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return LargeNavBar();
        } else {
          return SmallNavBar();
        }
      },
    );
  }
}

class LargeNavBar extends StatelessWidget {
  LargeNavBar({ Key? key }) : super(key: key);

  final TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 2000, maxHeight: heightOfLargeAppbar),
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
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        width: MediaQuery. of(context). size. width,
        constraints: const BoxConstraints(maxWidth: 1000, maxHeight: heightOfSmallAppbar),
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
          fontSize: 35,
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
          print("I need helppppp!");
        },
        onLongPress: () {
          print("Lol");
        },
      ),
    ],
  );
}

void searchBookSearch(String bookName) {
  print(bookName);
}