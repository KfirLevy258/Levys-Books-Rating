import 'package:flutter/material.dart';
import 'package:levys_books_rating/rating_class.dart';
import 'consts.dart';
import 'database_handling.dart';

class HelpDialog extends StatefulWidget {

  const HelpDialog({ Key? key }) : super(key: key);

  @override
  _HelpDialog createState() => _HelpDialog();
}

class _HelpDialog extends State<HelpDialog> {

  List<RatingClass> ratingList = [];

  @override
  void initState() {
    getSystemHelpData().then((value) {
      setState(() {
        ratingList = value;
      });
    });
    super.initState();
  }

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