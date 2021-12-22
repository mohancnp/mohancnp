import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/older/user_model.dart';
import 'core.dart';
import 'dbconst.dart';
import 'package:sqflite/sqlite_api.dart';

class UserTableHandler {
  Future addUser(User client) async {
    Database db = locator<DbStorage>().db;
    try {
      await db.rawInsert('''INSERT INTO ${Table.user}(
          ${UserField.name},${UserField.phone},
          ${UserField.points},${UserField.status},${UserField.membershipNo},
          ${UserField.email},${UserField.job},${UserField.gender},${UserField.profilePic})
          VALUES(
          "${client.name}","${client.phone}",
          "${client.points}","${client.status}","${client.membershipNo}",
          "${client.email}","${client.job}","${client.gender}","${client.imageUri}")''');
    } on Exception {
      throw (AppException(
        message: "Something's wrong with you!",
      ));
    }
  }

  Future getUser() async {
    Database db = locator<DbStorage>().db;
    try {
      var affectedRows = await db.query(Table.user);

      return affectedRows.last;
    } on Exception {
      throw (AppException(
        message: "Something's wrong with you!",
      ));
    }
  }

  Future removeUser() async {
    Database db = locator<DbStorage>().db;
    try {
      await db.delete(Table.user);
    } on Exception {
      throw (AppException(
        message: "Something's wrong with you!",
      ));
    }
  }
}
