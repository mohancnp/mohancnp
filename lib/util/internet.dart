import 'dart:async';
import 'dart:io';
import "package:connectivity_plus/connectivity_plus.dart";

class InternetConnectionHelper {
  static Future<bool> isConnectionReady() async {
    var _status = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        final response1 =
            await InternetAddress.lookup('208.65.153.238');
        final response2 =
            await InternetAddress.lookup("8.8.8.8");

        if (response1.isNotEmpty && response2.isNotEmpty) {
          _status = true;
        }
      } on SocketException catch (err) {
        _status = false;
        print(err);
      }
    }
    return _status;
  }
}
