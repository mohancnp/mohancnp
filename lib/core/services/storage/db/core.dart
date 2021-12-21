import 'dart:io';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'dbconst.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbStorage {
  late Database db;

  Future openDB() async {
    var path = await getDBPath();
    if (path != null) {
      try {
        db = await openDatabase(path, version: 1,
            onCreate: (Database db, int version) async {
          await db.execute(SqlQuery.cartTable);
        });
      } on Exception {
        throw (AppException(message: "somthing went wrong"));
      }
    }
  }

  Future getDBPath() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'metrocoffee.db');

    // Make sure the directory exists
    try {
      var dr = await Directory(databasesPath).create(recursive: true);
      if (await dr.exists()) {
        return path;
      }
    } catch (_) {
      // TODO: handle exception
    }
  }
}
