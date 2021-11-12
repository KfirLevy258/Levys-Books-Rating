import 'package:flutter/material.dart';
import 'consts.dart';
import 'layout_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: websiteTitle,
      theme: ThemeData(
        primarySwatch: primaryColorMaterial,
        fontFamily: fontFamily,
      ),
      home: const LayoutScreen(),
    );
  }
}
