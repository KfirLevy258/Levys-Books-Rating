import 'package:flutter/material.dart';
import 'package:levys_books_rating/rating_class.dart';
import 'consts.dart';

class InfoDialog extends StatefulWidget {
  final String title;
  final String message;

  const InfoDialog({ Key? key, required this.title, required this.message}) : super(key: key);

  @override
  _InfoDialogState createState() => _InfoDialogState();
}

class _InfoDialogState extends State<InfoDialog> {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(helpDialogBorderRadiusSize),
      ),
      elevation: defaultElevation,
      backgroundColor: Colors.transparent,
      child: Container(
        width: infoDialogWidth,
        height: infoDialogHeight,
        decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(helpDialogBorderRadiusSize))
        ),
        child: ListView(
          children: [
            Center(
              child: Text(
                widget.title,
                style: const TextStyle(
                    fontSize: bigTextSizeErrorPage
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                widget.message,
                style: const TextStyle(
                    fontSize: smallTextSizeErrorPage
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

