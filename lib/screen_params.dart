import 'book_card_class.dart';
import 'package:flutter/material.dart';

// Document this, we use a class in order to pass only a reference of params to the functions
class ScreenParams {
  Future<List<BookCardClass>> listOfBooks;
  List<Widget> listOfBooksWidgets;
  bool largeScreen;
  TextEditingController searchController;
  Function convertBooksListToWidgets;

  ScreenParams(this.listOfBooks, this.listOfBooksWidgets, this.largeScreen, this.searchController, this.convertBooksListToWidgets);
}