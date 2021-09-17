import 'package:shared_preferences/shared_preferences.dart';

Future addToken({required String provider, required String token}) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("auth_token", token);
    prefs.setString("provider", provider);
    // print("Provider: $provider, and Token $token added");
    return true;
  } on Exception catch (e) {
    print("Exception adding Token : $e");
  }
  // final loginstatus = prefs.getInt('loginstatus');
  // if (loginstatus == null) {
  //   return 0;
  // }
  // return loginstatus;
}

//after logout or session expiration
Future removeToken() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove('auth_token');
}

Future verifyToken() async {
  final prefs = await SharedPreferences.getInstance();
  var auth_token = prefs.getString('auth_token');
  var provider = prefs.getString('provider');
  print("Stored Token is: $auth_token, and the provider: $provider");
  if (auth_token != null && provider != null) {
    return true;
  }
  return false;
}

Future getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('auth_token');
}
