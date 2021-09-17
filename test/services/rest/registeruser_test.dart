// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:metrocoffee/models/user.dart';
import 'package:metrocoffee/services/rest/registeruser.dart';

void main() {
  test('Response code must be Ok or 200', () async{
    final RegisterUser registerUser = RegisterUser();
    var data = User("Mohan Dhakal", "mohan@gmail.com", "passpass", "passpass",
        "9807890879");
    var statusCode= await registerUser.addUser(data);
    expect(statusCode, 200);
    // counter.increment();
  });
}
