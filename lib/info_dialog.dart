import 'package:flutter/material.dart';
import 'package:levys_books_rating/rating_class.dart';
import 'consts.dart';

// TODO: Make info dialof or not-const msg
// TODO: use consts
class FormAlert extends StatefulWidget {

  const FormAlert({ Key? key }) : super(key: key);

  @override
  _FormAlertState createState() => _FormAlertState();
}

class _FormAlertState extends State<FormAlert> {

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
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(helpDialogBorderRadiusSize))
        ),
        child: ListView(
          children: const [
            FittedBox(
              // fit: BoxFit.fitHeight,
              child: Center(
                child: Text(
                  "You need to fill all fields",
                  style: TextStyle(
                    fontSize: 40
                  ),
                ),
              ),
            )
          ],
        ),

      ),

    );
  }
}

