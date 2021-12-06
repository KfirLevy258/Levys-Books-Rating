import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'consts.dart';
import 'database_handling.dart';
import 'layout_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: websiteTitle,
      theme: ThemeData(
        primarySwatch: primaryColorMaterial,
        fontFamily: fontFamily,
      ),
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // TODO: add 404 page
            print("Error");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return const LayoutScreen();
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
