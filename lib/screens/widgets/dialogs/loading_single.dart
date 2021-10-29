import 'package:flutter/material.dart';
import 'package:metrocoffee/core/theme.dart';

class LoadingWidget extends StatelessWidget {
  final backgroundColor;
  const LoadingWidget({Key? key, this.backgroundColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(top: 18),
            height: 38,
            width: 38,
            color: Colors.transparent,
            child: CircularProgressIndicator(
              value: 2,
              strokeWidth: 1.25,
            ),
          ),
          Text("Please Wait...")
        ],
      ),
    );
  }
}
