import 'package:metrocoffee/models/user.dart';
import 'package:metrocoffee/services/localstorage/db/core.dart';
import 'package:metrocoffee/services/localstorage/db/feildsname/dbfeilds.dart';
import 'package:sqflite/sqlite_api.dart';

class UserTableHandler {
  UserTableHandler._instance();

  static final UserTableHandler _service = UserTableHandler._instance();

  factory UserTableHandler.getInstance() {
    return _service;
  }

  Future addUser(Client client) async {
    Database? db = await openDB();
    try {
      if (db == null) {
        print("no db reference");
      } else {
        int affectedRows = await db.rawInsert('''INSERT INTO ${Table.user}(
          ${UserFeild.userId},${UserFeild.name},${UserFeild.phone},
          ${UserFeild.points},${UserFeild.status},${UserFeild.membershipNo},
          ${UserFeild.email},${UserFeild.job},${UserFeild.gender},${UserFeild.profilePic})
          VALUES(
          ${client.id},"${client.name}","${client.phone}",
          "${client.points}","${client.status}","${client.membershipNo}",
          "${client.email}","${client.job}","${client.gender}","${client.imageUri}")''');
        print("$affectedRows item added to user table");
      }
    } on Exception catch (e) {
      print("Error Creating DB ${e}");
    }
  }

  Future getUser() async {
    Database? db = await openDB();
    try {
      if (db == null) {
        print("no db reference");
      } else {
        var affectedRows = await db.query("${Table.user}");
        print("$affectedRows item from user table");
        return affectedRows[0];
      }
    } on Exception catch (e) {
      print("Error Creating DB ${e}");
    }
  }

  Future removeUser() async {
    Database? db = await openDB();
    try {
      if (db == null) {
        print("no db reference");
      } else {
        int affectedRows = await db.delete(Table.user);
        print("$affectedRows item deleted from user table");
      }
    } on Exception catch (e) {
      print("Error Creating DB ${e}");
    }
  }
}
