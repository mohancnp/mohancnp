import 'dart:async';
import 'dart:io';
import "package:connectivity_plus/connectivity_plus.dart";

class InternetConnectionHelper {
  static Future<bool> isConnectionReady() async {
    var _status = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        final response2 = await InternetAddress.lookup("8.8.8.8");

        if (response2.isNotEmpty) {
          _status = true;
        }
      } on SocketException {
        _status = false;
      }
    }
    return _status;
  }
}
