import 'package:flutter/material.dart';

showCustomSnackBarMessage(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text('$message'),
    duration: Duration(milliseconds: 700),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
