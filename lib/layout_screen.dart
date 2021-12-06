import 'package:flutter/material.dart';
import 'package:levys_books_rating/small_screen.dart';
import 'consts.dart';
import 'large_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > smallScreenMinSize) {
          return const LargeScreen();
        } else {
          return const SmallScreen();
        }
      },
    );
  }
}
