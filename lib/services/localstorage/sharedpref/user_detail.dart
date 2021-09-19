import 'package:shared_preferences/shared_preferences.dart';

Future addUserDetail(
    {required String name, required String email, required int id}) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
    prefs.setInt('id', id);
    prefs.setString('email', email);
    return true;
  } on Exception catch (exception) {
    print("Exception adding Userdetail : $exception");
  }
  return false;
}

Future<String?> getUserName() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('name');
    if (name == null)
      throw Exception("error retreiveing name from shared pref");
    return name;
  } on Exception catch (exception) {
    print("Exception adding Userdetail : $exception");
  }
  return null;
}

Future<String?> getEmail() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    if (email == null)
      throw Exception("error retreiveing name from shared pref");
    return email;
  } on Exception catch (exception) {
    print("Exception adding Userdetail : $exception");
  }
}

Future removeUserDetail() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
    prefs.remove('id');
    prefs.remove('email');
    return true;
  } on Exception catch (exception) {
    print("Exception adding Userdetail : $exception");
  }
  return false;
}
