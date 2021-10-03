import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/util/internet.dart';

class NoInternet extends StatefulWidget {
  NoInternet({Key? key}) : super(key: key);

  @override
  _NoInternetState createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  String noInernetMsg = "please restore your internet and try again!!!";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
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
                child: Text(noInernetMsg, textAlign: TextAlign.center)),
            MaterialButton(
              onPressed: () async {
                var ready = await isConnectionReady();
                if (ready)
                  Get.offAllNamed('/SplashScreen');
                else
                  setState(() => noInernetMsg = "Internet Problem,Try again");
              },
              child: Center(child: Text("tap to refresh")),
            )
          ],
        ),
      ),
    );
  }
}
