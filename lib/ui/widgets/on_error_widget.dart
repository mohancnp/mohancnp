import 'package:flutter/material.dart';

class OnErrorWidget extends StatelessWidget {
  final String message;
  const OnErrorWidget({Key? key, required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Center(
      child: Text(message),
    ));
  }
}
