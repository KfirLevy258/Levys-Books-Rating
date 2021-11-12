import 'package:flutter/material.dart';
import 'package:levys_books_rating/nav_bar.dart';
import 'books_screen.dart';
import 'consts.dart';

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

class LargeScreen extends StatelessWidget {
  const LargeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: LargeNavBar(),
          ),
          const LargeNBooksScreen()
        ],
      ),
    );
  }
}

class SmallScreen extends StatelessWidget {
  const SmallScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: SmallNavBar(),
          ),
          const SmallBooksScreen()
        ],
      ),
    );
  }
}