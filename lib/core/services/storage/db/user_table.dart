import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/older/user_model.dart';
import 'core.dart';
import 'dbfeilds.dart';
import 'package:sqflite/sqlite_api.dart';

class UserTableHandler {
  Future addUser(User client) async {
    // print("add user method called");
    Database db = locator<DbStorage>().db;
    try {
      int affectedRows = await db.rawInsert('''INSERT INTO ${Table.user}(
          ${UserFeild.name},${UserFeild.phone},
          ${UserFeild.points},${UserFeild.status},${UserFeild.membershipNo},
          ${UserFeild.email},${UserFeild.job},${UserFeild.gender},${UserFeild.profilePic})
          VALUES(
          "${client.name}","${client.phone}",
          "${client.points}","${client.status}","${client.membershipNo}",
          "${client.email}","${client.job}","${client.gender}","${client.imageUri}")''');

      print("$affectedRows item added to user table");
    } on Exception catch (e) {
      print("Error Creating DB $e");
      throw (AppException(
        message: "Something's wrong with you!",
      ));
    }
  }

  Future getUser() async {
    Database db = locator<DbStorage>().db;
    try {
      var affectedRows = await db.query("${Table.user}");
      print("$affectedRows item from user table");
      return affectedRows.last;
    } on Exception catch (e) {
      print("Error Creating DB $e");
      throw (AppException(
        message: "Something's wrong with you!",
      ));
    }
  }

  Future removeUser() async {
    Database db = locator<DbStorage>().db;
    try {
      int affectedRows = await db.delete(Table.user);
      print("$affectedRows item deleted from user table");
    } on Exception catch (e) {
      print("Error Creating DB $e");
      throw (AppException(
        message: "Something's wrong with you!",
      ));
    }
  }
}
