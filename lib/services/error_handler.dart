import 'package:flutter/material.dart';

class ErrorHandling {
  void showErrorDialogue(BuildContext context, String title, String message) {
//flutter define function
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        //return object of type dialogue
        return AlertDialog(
          title: Text("$title \n"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
