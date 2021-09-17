import "package:connectivity_plus/connectivity_plus.dart";

Future<bool> isConnectionReady() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else if (connectivityResult == ConnectivityResult.ethernet) {
    return true;
  } else if (connectivityResult == ConnectivityResult.none) {
    return false;
  }
  return false;
}
