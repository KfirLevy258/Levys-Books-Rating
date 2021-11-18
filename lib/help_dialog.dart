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
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 10,
      backgroundColor: Colors.transparent,
      child: Container(
        width: helpDialogWidth(width),
        height: helpDialogHeight(height),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(20)),
            const Text(
              "About our rating system",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
              width: helpDialogWidth(width) - 80,
              height: 3,
              color: Colors.blue,
            )
          ],
        ),

      ),

    );
  }
}
