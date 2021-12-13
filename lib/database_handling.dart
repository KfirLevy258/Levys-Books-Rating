import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'book_card_class.dart';
import 'consts.dart';

// TODO: Usr consts for data base collections, documents, fields
// TODO: Add to db the "about our system" text

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

Future<List<BookCardClass>> getRandomBooks(int numberOfRandomBooks) async {
  List<BookCardClass> listOfBooks = [];
  return FirebaseFirestore.instance.collection("books").get().then((docs) {
    final _random = Random();
    List<int> randomIndexesList = [];
    for (int index = 0; index < numberOfRandomBooks; index++) {
      if (index < docs.docs.length) {
        while (true) {
          int randomIndex = _random.nextInt(docs.docs.length);
          if (!randomIndexesList.contains(randomIndex)) {
            randomIndexesList.add(randomIndex);
            break;
          }
        }
      }
    }
    for (int index = 0; index < randomIndexesList.length; index++) {
      listOfBooks.add(
          BookCardClass(
              docs.docs[randomIndexesList[index]]["name"],
              docs.docs[randomIndexesList[index]]["author"],
              docs.docs[randomIndexesList[index]]["publishing_year"],
              docs.docs[randomIndexesList[index]]["book_data"],
              docs.docs[randomIndexesList[index]]["image"],
              docs.docs[randomIndexesList[index]]["language"],
              docs.docs[randomIndexesList[index]]["rating"])
      );
    }
    return listOfBooks;
  });
}

Future<List<BookCardClass>> getBooksByName(String name) async {
  // TODO: search not all the name, part of it is good
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


Future<String> uploadBookImageAndGetURL(PlatformFile file) async {
  try {
    TaskSnapshot upload = await FirebaseStorage.instance.ref().child(file.name).putData(
        file.bytes!,
        SettableMetadata(contentType: 'image/${file.extension}')
    );
    String url = await upload.ref.getDownloadURL();
    return url;
  } catch (e) {
    throw Exception('ERROR - in uploading image for : ${e.toString()}');
  }
}

void addBookToDatabase(BookCardClass bookCard, PlatformFile file) {
  uploadBookImageAndGetURL(file).then((imageURL) {
    FirebaseFirestore.instance.collection("books").add({
      "name": bookCard.title,
      "author": bookCard.author,
      "publishing_year": bookCard.year,
      "book_data": bookCard.bookData,
      "image": imageURL,
      "language": bookCard.language,
      "rating": bookCard.rating
    });
  });
}
