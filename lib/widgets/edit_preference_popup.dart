import 'package:flutter/material.dart';

showProfileDetailsDialog(BuildContext context) {
  // Create a new SimpleDialog
  SimpleDialog dialog = SimpleDialog(
    title: Text('Fill in your profile details'),
    children: <Widget>[
      Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Please fill in your name and email to continue.'),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
            Text('OK'),

        ],
      ),
    ],
  );

  // Display the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}
