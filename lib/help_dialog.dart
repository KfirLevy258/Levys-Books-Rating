import 'package:flutter/material.dart';
import 'consts.dart';

class HelpDialog extends StatefulWidget {

  const HelpDialog({ Key? key }) : super(key: key);

  @override
  _HelpDialog createState() => _HelpDialog();
}

class _HelpDialog extends State<HelpDialog> {

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
        child: Column(
          children: [
            dialogTitle(width),
            Padding(padding: EdgeInsets.all(7.5)),
            oneRowRatingWidget(Colors.red, 1),
            Padding(padding: EdgeInsets.all(7.5)),
            smallLine(width)

          ],
        ),

      ),

    );
  }
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

Widget smallLine(double width) {
  return Container(
    width: helpDialogWidth(width) - horizontalPadding * helpDialogPaddingFromSideSmallLine,
    height: helpDialogDefaultLineHeight,
    color: Colors.blue,
  );
}

Widget oneRowRatingWidget(Color ratingCircleColor, int rating) {
  return SizedBox(
    height: 70,
    width: 500,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.all(22)),
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: new BoxDecoration(
                    color: ratingCircleColor,
                    shape: BoxShape.circle,
                  ),
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      rating.toString(),
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),

                  ),
                )
              ],
            ),
            Container(
              width: 70.0,
              height: 70.0,
              decoration: new BoxDecoration(
                // color: Colors.blue,
                image: DecorationImage(image: AssetImage(tempGetImageAsset(rating.toString())), fit: BoxFit.fill),
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
        Padding(padding: EdgeInsets.all(20)),
        Directionality(
          textDirection: TextDirection.ltr,
          child: SizedBox(
            height: 60,
            width: 300,
            child: ListView(
              children: [
                Text(
                    "fhgkahfjsdhfasjdhfkjashkjasbfjkasbfjfhgkahfjsdhfasjdhfkjashkjasbfjk\n"
                        "asbfjfhgkahfjsdhfasjdhfkjashkjasbfjkasbfjfhgkahfj\nsdhfasjdhfkjashkjasbfjk"
                        "asbfjfhgkahfjsdhfasjdhfkjashkjasbfjkasbfjfhgkahfjsdhfasjdhfkjashkjasbfjkasbf"
                        "jfhgkahfjsdhfasjdhfkjashkjasbfjkasbfjfhgkahfjs\ndhfasjdhfkjashkjasbfjkasbfjfhgkah"
                        "fjsdhfasjdhfkjashkjasbfjkasbfjfhgkahfjsdhfasjdhfkjas\nhkjasbfjkasbfjfhgkahfjsdh"
                        "fasjdhfkjashkjasbfjkasbfjfhgkahfjsdhfasjdhfkjashkjasbfjkasbfjfhgkahfjsdhfasjdhfk"
                        "jashkjasbfjkasbfjfhgkahfjsdhfasjdhfkjashkjasbfjkasbfjfhgkahfj\nsdhfasjdhfkjashkjas",
                    style: const TextStyle(fontSize: bookDataFontSize,),
                    textAlign: TextAlign.justify
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}