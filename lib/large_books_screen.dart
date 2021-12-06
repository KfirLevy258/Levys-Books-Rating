import 'package:flutter/cupertino.dart';
import 'book_card_class.dart';
import 'book_card_widget.dart';
import 'consts.dart';

class LargeBooksScreen extends StatefulWidget {
  LargeBooksScreen({ Key? key, required this.listOfBooks}) : super(key: key);

  Future<List<BookCardClass>> listOfBooks;

  @override
  State<StatefulWidget> createState() {
    return _LargeBooksScreenState();
  }
}

class _LargeBooksScreenState extends State<LargeBooksScreen> {

  List<Row> listOfBooksWidgets = [];
  bool largeScreen = true;

  @override
  void initState() {
    convertBooksListToWidgets();
    super.initState();
  }

  convertBooksListToWidgets() {
    widget.listOfBooks.then((docs) {
      setState(() {
        for (int index=0; index<docs.length; index=index+maxBooksInRow) {
          List<BookCard> booksInRow = [];
          for (int col=0; col<maxBooksInRow; col++) {
            if (index + col < docs.length) {
              booksInRow.add(BookCard(largeScreen: largeScreen, book: docs[index + col]));
            }
          }
          listOfBooksWidgets.add(Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: booksInRow,
          ));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery. of(context). size. width,
      height: MediaQuery. of(context). size. height - heightOfLargeAppbar,
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