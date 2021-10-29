import 'package:flutter/material.dart';
import 'consts.dart';

class NavBar extends StatelessWidget {
//  const NavBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1000)
          return LargeNavBar();
        else
          return SmallNavBar();
      },
    );
  }
}

class LargeNavBar extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 2000, maxHeight: 90),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            title(),
            searchBox(context),
            actionButtons(context)
          ],
        ),
      ),
    );
  }

  void searchBook(String bookName) {
    print(bookName);
  }

  Widget title() {
    return const Text(
      websiteTitle,
      style: TextStyle(
        fontWeight: appbarTitleFontWeight,
        fontSize: 35,
        color: Colors.white
      ),
      textAlign: TextAlign.right,
    );
  }

  Widget searchBox(BuildContext context) {
    return Container(
      width: widthOfSearchBox(MediaQuery. of(context). size. width),
      height: heightOfSearchBox,
      decoration: BoxDecoration(color: primaryColorMaterial.shade50),
      child: Center(
        child: TextField(
                controller: _searchController,
          onSubmitted: (String searchValue) {
                  searchBook(searchValue);
          },
          decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                searchBook(_searchController.value.text);
              },
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
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
        ),
      ],
    );
  }
}

class SmallNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
