import 'package:flutter/material.dart';
import 'package:levys_books_rating/rating_class.dart';
import 'consts.dart';

class HelpDialog extends StatefulWidget {

  const HelpDialog({ Key? key }) : super(key: key);

  @override
  _HelpDialog createState() => _HelpDialog();
}

class _HelpDialog extends State<HelpDialog> {
  // TODO: Remove this
  List<RatingClass> ratingList = [
    new RatingClass(Colors.red, 1, "Don’t get any close to the book - impossible to finish. If you find yourself stuck with it alone on an island, you will probably rather play X-O with yourself in the sand."),
    new RatingClass(Colors.orange, 2, "A book that takes a lot of effort and time to finish, you really need to put an effort to read it. A great gift for a person you hates."),
    new RatingClass(Colors.yellow, 3, "A classic flight book, a good written book with characters that are easy to relate with. The time flies by without even noticing. Not a work of art but fun to read. Usually it has a not-particularly-surprising ending."),
    new RatingClass(Colors.greenAccent, 4, "A good book, well worth the time to read. You should put time and energy to read this book. A book that could be given as a gift so that people will think good things of you."),
    new RatingClass(Colors.green, 5, "An inspiring book. A book that the person before reading the book is not the same person after reading the book. A book worth writing that you read it in your resume. A book to quote lines from in your wedding."),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    double height = MediaQuery. of(context). size. height;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(helpDialogBorderRadiusSize),
      ),
      elevation: defaultElevation,
      backgroundColor: Colors.transparent,
      child: Container(
        width: helpDialogWidth(width),
        height: helpDialogHeight(height),
        decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(helpDialogBorderRadiusSize))
        ),
        child: ListView(
          children: [
            dialogTitle(width),
            ratingExplanation(width, ratingList),
            okButton(context)
          ],
        ),

      ),

    );
  }
}

Widget ratingExplanation(double width, List<RatingClass> ratingList) {
  List<Widget> ratingListWidget = [];
  for (var i=0; i<ratingList.length; i++) {
    ratingListWidget.add(Column(
      children: [
        const Padding(padding: EdgeInsets.all(helpDialogPaddingFromLines)),
        oneRowRatingWidget(ratingList[i].color, ratingList[i].rating, ratingList[i].text, width),
        const Padding(padding: EdgeInsets.all(helpDialogPaddingFromLines)),
        smallLine(width),
      ],
    ));
  }
  return Column(
    children: ratingListWidget,
  );
}

Widget dialogTitle(double width) {
  return Column(
    children: [
      const Padding(padding: defaultPadding),
      const SelectableText(
        helpDialogTitle,
        style: TextStyle(
            fontSize: helpDialogTitleSize,
            fontWeight: FontWeight.bold,
            color: Colors.blue
        ),
        textAlign: TextAlign.center,
      ),
      const Padding(padding: defaultPadding),
      Container(
        width: helpDialogWidth(width) - horizontalPadding * helpDialogPaddingFromSideBigLine,
        height: helpDialogDefaultLineHeight,
        color: Colors.blue,
      ),
    ],
  );
}

Widget okButton(BuildContext context) {
  return Column(
    children: [
      const Padding(padding: EdgeInsets.all(helpDialogPaddingFromLines)),
      TextButton(
          onPressed: () {
            // Closes the dialog window
            Navigator.pop(context);
          },
          child: Container(
            width: helpDialogButtonWidth,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(helpDialogBorderRadiusSize))
            ),
            child: const Text(
              helpDialogButtonText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: helpDialogButtonSize
              ),
            ),
          )
      ),
      const Padding(padding: EdgeInsets.all(helpDialogPaddingFromLines)),
    ],
  );
}

Widget smallLine(double width) {
  return Container(
    width: helpDialogWidth(width) - horizontalPadding * helpDialogPaddingFromSideSmallLine,
    height: helpDialogDefaultLineHeight,
    color: Colors.blue,
  );
}

Widget oneRowRatingWidget(Color ratingCircleColor, int rating, String text, double width) {
  return SizedBox(
    height: helpDialogRatingWidgetHeight,
    width: helpDialogWidth(width),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Row(
              children: [
                const Padding(padding: EdgeInsets.all(helpDialogCirclePadding)),
                Container(
                  width: helpDialogCircleSize,
                  height: helpDialogCircleSize,
                  decoration: BoxDecoration(
                    color: ratingCircleColor,
                    shape: BoxShape.circle,
                  ),
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      rating.toString(),
                      style: const TextStyle(
                        color: Colors.white
                      ),
                    ),

                  ),
                )
              ],
            ),
            Container(
              width: helpDialogCircleSize,
              height: helpDialogCircleSize,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(tempGetImageAsset(rating.toString())), fit: BoxFit.fill),
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
        const Padding(padding: defaultPadding),
        Directionality(
          textDirection: TextDirection.ltr,
          child: SizedBox(
            height: helpDialogTextHeight,
            width: helpDialogTextWidth(width),
            child: ListView(
              children: [
                Text(
                  text,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: helpDialogTextSize),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}