import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO: use consts
class ErrorPage404 extends StatelessWidget{
  const ErrorPage404({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(MediaQuery. of(context). size. height / 8)),
          const Center(
            child: Text(
              "404 Error - Page not found",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 60),
            ),
          ),
          const Center(
            child: Text(
              "Please try to reload this page. If the problem not solved,\n check your connection to the internet :)",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}