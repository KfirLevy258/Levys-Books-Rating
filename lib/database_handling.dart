import 'package:cloud_firestore/cloud_firestore.dart';
import 'book_card_class.dart';

Future<List<BookCardClass>> getAllBooks() async {
  List<BookCardClass> listOfBooks = [];
  return FirebaseFirestore.instance.collection("books").get().then((docs) {
    for (int index=0; index<docs.docs.length; index++) {
      listOfBooks.add(
          BookCardClass(
              docs.docs[index]["name"],
              docs.docs[index]["author"],
              docs.docs[index]["publishing_year"],
              docs.docs[index]["book_data"],
              docs.docs[index]["image"],
              docs.docs[index]["language"],
              docs.docs[index]["rating"])
      );
    }
    return listOfBooks;
  });
}

Future<List<BookCardClass>> getBooksByName(String name) async {
  List<BookCardClass> listOfBooks = [];
  return FirebaseFirestore.instance.collection("books").where("name", isEqualTo: name).get().then((doc) {
    for (int index=0; index<doc.docs.length; index++) {
      listOfBooks.add(
          BookCardClass(
              doc.docs[index]["name"],
              doc.docs[index]["author"],
              doc.docs[index]["publishing_year"],
              doc.docs[index]["book_data"],
              doc.docs[index]["image"],
              doc.docs[index]["language"],
              doc.docs[index]["rating"])
      );
    }
    return listOfBooks;
  });
}

