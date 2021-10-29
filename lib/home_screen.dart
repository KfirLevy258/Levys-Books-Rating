import 'package:flutter/material.dart';
import 'package:levys_books_rating/nav_bar.dart';
import 'consts.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: heightOfAppbar,
            child: NavBar(),

          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  width: 300,
                  height: 200,
                  color: Colors.redAccent,
                ),
                Container(
                  width: 300,
                  height: 200,
                  color: Colors.grey,
                )
              ],
            ),
          )

        ],
      ),
    );
  }

  void searchBook(String bookName) {
    print(bookName);
  }

  AppBar createAppBar() {
    return AppBar(
      title: Row(
//        mainAxisAlignment: MainAxisAlignment,
        children: [
          const Text(
            websiteTitle,
            style: TextStyle(
              fontFamily: appbarTitleFont,
              fontWeight: appbarTitleFontWeight,
              fontSize: 35,
            ),
            textAlign: TextAlign.right,
          ),
          Padding(padding: EdgeInsets.all(paddingSearchAndTile(MediaQuery. of(context). size. width))),
          Container(
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
          ),
          Padding(padding: EdgeInsets.all(paddingSearchAndTile(MediaQuery. of(context). size. width))),
        ],
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.help),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.language),
          onPressed: () {},
        )
      ],
    );
  }
}
