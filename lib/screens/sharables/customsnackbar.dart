import 'package:flutter/material.dart';

showCustomSnackBar(context, message) {
  final snackBar = SnackBar(
    content: Text('$message'),
    duration: Duration(milliseconds: 500),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
