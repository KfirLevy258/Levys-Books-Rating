import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'consts.dart';

typedef BooleanCallback = void Function(bool val);

Widget openQuestions(String hintText, TextEditingController controller, bool isString, double width){
  return Column(
    children: [
      Text(
        hintText,
        style: const TextStyle(
            fontSize: formWidgetsTitleSize
        ),
      ),
      const Padding(padding: formWidgetsPadding),
      SizedBox(
        width: width,
        child: TextFormField(
            maxLines: null,
            controller: controller,
            textAlign: TextAlign.center,
            textInputAction: TextInputAction.newline,
            keyboardType: isString ? TextInputType.multiline : const TextInputType.numberWithOptions(),
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal)
              ),
            ),
            validator: (value) {
              if (value!.isEmpty){
                return 'Please enter value';
              }
              if (!isString && !isNumeric(value)){
                return 'Please enter only numbers';
              }
              return null;
            }
        ),
      ),
    ],
  );
}

Widget booleanInputWidget(String label, bool initValue, BooleanCallback callback) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: formWidgetsTitleSize),
      ),
      const Padding(padding: formWidgetsPadding),
      Checkbox(
        checkColor: Colors.white,
        value: initValue,
        onChanged: (bool? value) {
          callback(value!);
        },
      ),
    ],
  );
}


bool isNumeric(String s) {
  return int.tryParse(s) != null;
}