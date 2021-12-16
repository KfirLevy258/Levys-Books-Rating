import 'package:flutter/material.dart';
import 'consts.dart';

class ErrorPage404 extends StatelessWidget{
  const ErrorPage404({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(getErrorPagePadding(MediaQuery. of(context). size. height))),
          const Center(
            child: Text(
              bigTextErrorPage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: bigTextSizeErrorPage),
            ),
          ),
          const Center(
            child: Text(
              smallTextErrorPage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: smallTextSizeErrorPage),
            ),
          ),
        ],
      ),
    );
  }
}