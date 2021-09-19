import 'package:flutter/material.dart';
class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/no-wifi.png',
            height: 50,
            width: 50,
          ),
          SizedBox(
              width: 200,
              child: Text("please restore your internet and try again!!!",
                  textAlign: TextAlign.center))
        ],
      ),
    );
  }
}
