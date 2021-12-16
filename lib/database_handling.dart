import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:levys_books_rating/rating_class.dart';
import 'book_card_class.dart';
import 'consts.dart';

Future<List<BookCardClass>> getAllBooks() async {
  List<BookCardClass> listOfBooks = [];
  return FirebaseFirestore.instance.collection(databaseBooksCollection).get().then((docs) {
    for (int index=0; index<docs.docs.length; index++) {
      listOfBooks.add(
          BookCardClass(
              docs.docs[index][databaseBookName],
              docs.docs[index][databaseBookAuthor],
              docs.docs[index][databaseBookYear],
              docs.docs[index][databaseBookData],
              docs.docs[index][databaseBookImage],
              docs.docs[index][databaseBookLanguage],
              docs.docs[index][databaseBookRating])
      );
    }
    return listOfBooks;
  });
}

Future<List<BookCardClass>> getRandomBooks(int numberOfRandomBooks) async {
  List<BookCardClass> listOfBooks = [];
  return FirebaseFirestore.instance.collection(databaseBooksCollection).get().then((docs) {
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
              docs.docs[randomIndexesList[index]][databaseBookName],
              docs.docs[randomIndexesList[index]][databaseBookAuthor],
              docs.docs[randomIndexesList[index]][databaseBookYear],
              docs.docs[randomIndexesList[index]][databaseBookData],
              docs.docs[randomIndexesList[index]][databaseBookImage],
              docs.docs[randomIndexesList[index]][databaseBookLanguage],
              docs.docs[randomIndexesList[index]][databaseBookRating])
      );
    }
    return listOfBooks;
  });
}

Future<List<BookCardClass>> getBooksByName(String name) async {
  List<BookCardClass> listOfBooks = [];
  return getAllBooks().then((allBooks) {
    for (int index=0; index<allBooks.length; index++) {
      if (allBooks[index].title.toLowerCase().contains(name.toLowerCase()) ||
          name.toLowerCase().contains(allBooks[index].title.toLowerCase())) {
        listOfBooks.add(allBooks[index]);
      }
    }
    return listOfBooks;
  });
}

Future<List<RatingClass>> getSystemHelpData() async {
  List<RatingClass> listOfRatings = [];
  return FirebaseFirestore.instance.collection(databaseAssetsCollection).get().then((doc) {
    for (int index=0; index<doc.docs.length; index++) {
      listOfRatings.add(
          RatingClass(
            ratingColors[int.parse(doc.docs[index].id)],
            doc.docs[index][databaseAssetsImage],
            int.parse(doc.docs[index].id),
            doc.docs[index][databaseAssetsText],
          )
      );
    }
    return listOfRatings;
  });
}


Future<String> uploadBookImageAndGetURL(PlatformFile file) async {
  try {
    TaskSnapshot upload = await FirebaseStorage.instance.ref("/books_images").child(file.name).putData(
        file.bytes!,
        SettableMetadata(contentType: 'image/${file.extension}')
    );
    String url = await upload.ref.getDownloadURL();
    return url;
  } catch (e) {
    throw Exception('ERROR - in uploading image for : ${e.toString()}');
  }
}

void addBookToDatabase(BookCardClass bookCard) {
  FirebaseFirestore.instance.collection(databaseBooksCollection).add({
    databaseBookName: bookCard.title,
    databaseBookAuthor: bookCard.author,
    databaseBookYear: bookCard.year,
    databaseBookData: bookCard.bookData,
    databaseBookImage: bookCard.image,
    databaseBookLanguage: bookCard.language,
    databaseBookRating: bookCard.rating
  });
}


