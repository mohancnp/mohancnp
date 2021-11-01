import 'package:flutter/material.dart';

class ImageLoadingBuilder extends StatelessWidget {
  const ImageLoadingBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
