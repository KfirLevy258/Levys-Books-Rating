import 'package:flutter/material.dart';
import 'package:levys_books_rating/book_card_class.dart';
import 'book_card_widget.dart';
import 'consts.dart';

// TODO: Remove this
BookCardClass b1 = BookCardClass("Prodigal Son", "Gregg Hurwitz", "2021",
    "As a boy, Evan Smoak was pulled out of a foster home and trained in an off-the-books operation known as the Orphan Program. He was a government assassin, perhaps the best, known to a few insiders as Orphan X. He eventually broke with the Program and adopted a new name—The Nowhere Man—and a new mission, helping the most desperate in their times of trouble. But the highest power in the country has made him a tempting offer—in exchange for an unofficial pardon, he must stop his clandestine activities as The Nowhere Man. Now Evan has to do the one thing he’s least equipped to do—live a normal life."
        "\nBut then he gets a call for help from the one person he never expected. A woman claiming to have given him up for adoption, a woman he never knew—his mother. Her unlikely request: help Andrew Duran—a man whose life has gone off the rails, who was in the wrong place at the wrong time, bringing him to the deadly attention of very powerful figures. Now a brutal brother & sister assassination team are after him and with no one to turn to, and no safe place to hide, Evan is Duran’s only option. But when the hidden cabal catches on to what Evan is doing, everything he’s fought for is on the line—including his own life."
    , "books/profigal_son.jpeg", "English", 3);
BookCardClass b2 = BookCardClass("הבן האובד", "גרג הורוביץ", "2021",
    'בהיותו ילד אוואן סמוק נבחר ונלקח מבית היתומים שבו התגורר. הוא גודל ואומן במסגרת פרויקט X – תוכנית ממשלתית סודית, שבמסגרתה הוא נשלח למקומות המסוכנים ביותר בעולם כדי לבצע משימות, שהממשלה מכחישה כל קשר אליהן. ואז הוא נמלט מהפרויקט, ירד למחתרת והפך להיות האיש משומקום, דמות לוטה בערפל המגישה את עזרתה רק לנואשים ביותר.\n'
        'אוואן נאלץ לצאת לפרישה מוקדמת, אבל אז מגיעה שיחת טלפון חדשה: "אוואן, זאת אמא שלך, שמעתי שאתה עוזר לאנשים..." היא מבקשת ממנו להגן על אנדרו דוראן, אדם זר לחלוטין שנקלע למקום הלא נכון בזמן הלא נכון. אך האם זאת באמת אימו? האם הוא יכול לבטוח בה?\n'
        'דוראן עלה על הכוונת של אדם מסוכן במיוחד שאינו יודע גבולות, והוא משלח בעקבותיו צמד רוצחים צמא דם – אח ואחות קטלניים. ככל שהטבעת סביב דוראן מתהדקת, אוואן מגלה שהפעם המשימה שלו הופכת להיות אישית ביותר, והדם העומד להישפך עלול להיות דמו שלו...\n'
    , "books/lostson_Master.jpeg", "Hebrew", 5);

class LargeNBooksScreen extends StatelessWidget {
  const LargeNBooksScreen({ Key? key }) : super(key: key);

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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BookCard(largeScreen: true, book: b1,),
                    BookCard(largeScreen: true, book: b2,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BookCard(largeScreen: true, book: b1,),
                    BookCard(largeScreen: true, book: b2,),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SmallBooksScreen extends StatelessWidget {
  const SmallBooksScreen({ Key? key }) : super(key: key);

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
              children: [
                BookCard(largeScreen: false, book: b1,),
                BookCard(largeScreen: false, book: b2,),
              ],
            ),
          )
        ],
      ),
    );
  }
}