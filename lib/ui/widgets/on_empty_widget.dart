import 'package:flutter/material.dart';

class EmptyDataWidget extends StatelessWidget {
  final String message;
  const EmptyDataWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        child: Center(
      child: Text("Products Not Available"),
    ));
  }
}
