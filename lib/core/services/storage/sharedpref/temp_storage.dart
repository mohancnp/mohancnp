import 'package:shared_preferences/shared_preferences.dart';

class TempStorageKeys {
  static const String firstTimeUser = "ftu";
  static const String authToken = "auth_token";
  static const String provider = "provider";
}

class TempStorage {
  late SharedPreferences _prefs;

  Future<void> initialise() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? readString(String key) {
    return _prefs.getString(key);
  }

  bool? readBool(String key) {
    return _prefs.getBool(key);
  }

  void writeString(String key, String value) async {
    try {
      _prefs.setString(key, value);
    } on Exception catch (e) {
      print("Exception adding String to shared pref : $e");
    }
  }

  void writeBool(String key, bool value) {
    try {
      _prefs.setBool(key, value);
    } on Exception catch (e) {
      print("Exception adding Bool to shared pref. : $e");
    }
  }

  void delete(String key) {
    _prefs.remove(key);
  }

  void clear() {
    _prefs.clear();
  }
}
