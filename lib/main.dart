import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'consts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: primaryColorMaterial,
        fontFamily: fontFamily,
      ),
      home: HomeScreen(),
    );
  }
}
