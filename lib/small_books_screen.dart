import 'package:flutter/cupertino.dart';
import 'book_card_class.dart';
import 'book_card_widget.dart';
import 'consts.dart';

class SmallBooksScreen extends StatefulWidget {
  SmallBooksScreen({ Key? key, required this.listOfBooks}) : super(key: key);

  Future<List<BookCardClass>> listOfBooks;

  @override
  State<StatefulWidget> createState() {
    return _SmallBooksScreenState();
  }
}

class _SmallBooksScreenState extends State<SmallBooksScreen> {

  List<BookCard> listOfBooksWidgets = [];
  bool largeScreen = false;

  @override
  void initState() {
    convertBooksListToWidgets();
    super.initState();
  }

  convertBooksListToWidgets() {
    widget.listOfBooks.then((docs) {
      setState(() {
        for (int index=0; index<docs.length; index++) {
          listOfBooksWidgets.add(BookCard(largeScreen: largeScreen, book: docs[index]));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery. of(context). size. width,
      height: MediaQuery. of(context). size. height - heightOfSmallAppbar - 2 * verticalPadding,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: listOfBooksWidgets
            ),
          )
        ],
      ),
    );
  }

}