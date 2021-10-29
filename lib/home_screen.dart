import 'package:flutter/material.dart';
import 'package:levys_books_rating/book_card.dart';
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
  BookCard b = BookCard("Prodigal Son", "Gregg Hurwitz", "2021",
      "As a boy, Evan Smoak was pulled out of a foster home and trained in an off-the-books operation known as the Orphan Program. He was a government assassin, perhaps the best, known to a few insiders as Orphan X. He eventually broke with the Program and adopted a new name—The Nowhere Man—and a new mission, helping the most desperate in their times of trouble. But the highest power in the country has made him a tempting offer—in exchange for an unofficial pardon, he must stop his clandestine activities as The Nowhere Man. Now Evan has to do the one thing he’s least equipped to do—live a normal life."
          "\nBut then he gets a call for help from the one person he never expected. A woman claiming to have given him up for adoption, a woman he never knew—his mother. Her unlikely request: help Andrew Duran—a man whose life has gone off the rails, who was in the wrong place at the wrong time, bringing him to the deadly attention of very powerful figures. Now a brutal brother & sister assassination team are after him and with no one to turn to, and no safe place to hide, Evan is Duran’s only option. But when the hidden cabal catches on to what Evan is doing, everything he’s fought for is on the line—including his own life."
      , "books/profigal_son.jpeg", "English", 3);
  BookCard b2 = BookCard("הבן האובד", "גרג הורוביץ", "2021",
      'בהיותו ילד אוואן סמוק נבחר ונלקח מבית היתומים שבו התגורר. הוא גודל ואומן במסגרת פרויקט X – תוכנית ממשלתית סודית, שבמסגרתה הוא נשלח למקומות המסוכנים ביותר בעולם כדי לבצע משימות, שהממשלה מכחישה כל קשר אליהן. ואז הוא נמלט מהפרויקט, ירד למחתרת והפך להיות האיש משומקום, דמות לוטה בערפל המגישה את עזרתה רק לנואשים ביותר.\n'
          'אוואן נאלץ לצאת לפרישה מוקדמת, אבל אז מגיעה שיחת טלפון חדשה: "אוואן, זאת אמא שלך, שמעתי שאתה עוזר לאנשים..." היא מבקשת ממנו להגן על אנדרו דוראן, אדם זר לחלוטין שנקלע למקום הלא נכון בזמן הלא נכון. אך האם זאת באמת אימו? האם הוא יכול לבטוח בה?\n'
          'דוראן עלה על הכוונת של אדם מסוכן במיוחד שאינו יודע גבולות, והוא משלח בעקבותיו צמד רוצחים צמא דם – אח ואחות קטלניים. ככל שהטבעת סביב דוראן מתהדקת, אוואן מגלה שהפעם המשימה שלו הופכת להיות אישית ביותר, והדם העומד להישפך עלול להיות דמו שלו...\n'
      , "books/lostson_Master.jpeg", "Hebrew", 3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: const NavBar(),
          ),
//          bookCardBuild(context, b)
          Expanded(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    bookCardBuild(context, b),
                    const Padding(padding: cardDefaultPadding),
                    bookCardBuild(context, b2),
                  ],
                ),
              ],
            ),
          )

        ],
      ),
    );
  }

  Widget bookCardBuild(BuildContext context, BookCard book) {
    return Container(
      padding: cardDefaultPadding,
      height: heightOfCard,
      width: widthOfCard(MediaQuery. of(context). size. width),
      child: buildCard(book)
    );
  }

  Widget buildCard(BookCard book) {
    return
      book.language == "Hebrew"
    ? Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(padding: cardDefaultPadding),
          bookDataInCard(book, CrossAxisAlignment.end, TextAlign.right),
          const Padding(padding: cardDefaultPadding),
          bookImageInCard(book),
        ],
      ),
      elevation: 10,
    ) : Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardBorderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(padding: cardDefaultPadding),
            bookImageInCard(book),
            const Padding(padding: cardDefaultPadding),
            bookDataInCard(book, CrossAxisAlignment.start, TextAlign.left)
          ],
        ),
        elevation: 10,
      );
  }

  Widget bookImageInCard(BookCard book) {
    return Container(
      height: cardRowHeight,
      width: cardImageWidth,
      padding: cardDefaultPadding,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(book.image)),
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
    );
  }

  Widget bookDataInCard(BookCard book, CrossAxisAlignment alignment, TextAlign textAlignment) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: alignment,
      children: [
        const Padding(padding: cardDefaultPadding),
        SizedBox(
          height: cardTitleHeight,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              book.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: cardSubTitleHeight,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              book.author + " - " + book.year,
            ),
          ),
        ),
        const Padding(padding: cardDefaultPadding),
        SizedBox(
          width: cardDataWidth,
          height: cardDataHeight,
          child: ListView(
            children: [
              Text(
                book.bookData,
                style: const TextStyle(fontSize: 12,),
                textAlign: textAlignment
              ),
            ],
          ),
        )
      ],
    );
  }
}
