import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:levys_books_rating/book_card_class.dart';
import 'package:levys_books_rating/consts.dart';
import 'database_handling.dart';
import 'info_dialog.dart';
import 'form_widgets.dart';

class AddBookScreen extends StatefulWidget{
  const AddBookScreen({ Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddBookScreenState();
  }
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _bookName = TextEditingController();
  final TextEditingController _author = TextEditingController();
  final TextEditingController _year = TextEditingController();
  final TextEditingController _bookData = TextEditingController();
  final TextEditingController _rating = TextEditingController();
  bool bookInHebrew = true;
  FilePickerResult? imagePicker;

  String addBookUploadImageTextTemp = addBookUploadImageText;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(addBookTitle),
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                questionWithPadding("Book name", _bookName, true, addBookWidgetsWidth(width)),
                questionWithPadding("Author", _author, true, addBookWidgetsWidth(width)),
                questionWithPadding("Publishing year", _year, false, addBookWidgetsWidth(width)),
                questionWithPadding("Book extra data", _bookData, true, addBookWidgetsWidth(width)),
                questionWithPadding("Rating", _rating, false, addBookWidgetsWidth(width)),
                booleanQuestionWithPadding("Hebrew?"),
                uploadImageWithPadding(),
                submitButtonWithPadding(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget questionWithPadding(String title, TextEditingController controller, bool isString, width) {
    return Column(
      children: [
        const Padding(padding: addBookPadding),
        openQuestions(title, controller, isString, width),
      ],
    );
  }

  Widget booleanQuestionWithPadding(String title) {
    return Column(
      children: [
        const Padding(padding: addBookPadding),
        booleanInputWidget(title, bookInHebrew, ((value) {
          setState(() {
            bookInHebrew = value;
          });
        })),
      ],
    );
  }

  Widget uploadImageWithPadding() {
    return Column(
      children: [
        const Padding(padding: defaultPadding),
        ElevatedButton(
          child: Text(addBookUploadImageTextTemp),
          onPressed: () async {
            imagePicker = await FilePicker.platform.pickFiles(
                type: FileType.image
            );

            if (imagePicker != null) {
              setState(() {
                addBookUploadImageTextTemp = imagePicker!.files.last.name + " selected";
              });
            }
          },
        ),
      ],
    );
  }

  Widget submitButtonWithPadding() {
    return Column(
      children: [
        const Padding(padding: defaultPadding),
        ElevatedButton(
          onPressed: () {
            // Validate returns true if the form is valid, otherwise false.
            if (_formKey.currentState!.validate() && imagePicker != null) {
              // TODO: Send from here the real url
              addBookToDatabase(
                  BookCardClass(
                      _bookName.text,
                      _author.text,
                      _year.text,
                      _bookData.text,
                      "",
                      bookInHebrew ? "Hebrew" : "English",
                      int.parse(_rating.text)),
                  imagePicker!.files.last
              );
              cleanForm();
              // TODO: use info and inform user that data uploaded
            }
            else {
              showDialog(
                context: context,
                builder: (_) {
                  return const FormAlert();
                },
              );
            }

          },
          child: const Text(addBookSubmitButtonTitle),)
      ],
    );
  }

  cleanForm() {
    setState(() {
      _formKey.currentState!.reset();
      _bookName.clear();
      _author.clear();
      _year.clear();
      _bookData.clear();
      _rating.clear();
      addBookUploadImageTextTemp = addBookUploadImageText;
      bookInHebrew = true;
    });
  }
}


