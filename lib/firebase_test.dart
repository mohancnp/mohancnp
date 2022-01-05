import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:metrocoffee/ui/src/palette.dart';

import 'util/debug_printer.dart';

class FireBaseTest extends StatefulWidget {
  const FireBaseTest({Key? key}) : super(key: key);

  @override
  State<FireBaseTest> createState() => _FireBaseTestState();
}

class _FireBaseTestState extends State<FireBaseTest> {
  late FirebaseMessaging messaging;
  @override
  void initState() {
    super.initState();
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      dPrint("Token:  " + value.toString());
    });
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage event) {
        print("message recieved");
        print(event.notification!.body);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Notification"),
              content: Text(event.notification!.body!),
              actions: [
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        );
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print('Message clicked!');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Palette.pagebackgroundcolor,
      child: const Center(
        child: Text("Firbease Message Testing Service"),
      ),
    );
  }
}
