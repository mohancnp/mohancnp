import 'dart:io';
import 'package:metrocoffee/services/localstorage/db/feildsname/dbfeilds.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

var CartFeildTable = "CartFeild";

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
    print("Directory doesn't exists");
  }
}

Future openDB() async {
  var path = await getDBPath();
  if (path != null) {
    // open the database
    try {
      Database database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute('''CREATE TABLE ${Table.cart} (
             ${CartFeild.id} INTEGER PRIMARY KEY AUTOINCREMENT,${CartFeild.productId} INTEGER,${CartFeild.price} REAL,${CartFeild.variantId} INTEGER,
             ${CartFeild.qty} INTEGER,${CartFeild.name} TEXT,${CartFeild.imageUri} TEXT,${CartFeild.options} TEXT,${CartFeild.addons} TEXT)''');

        await db.execute('''CREATE TABLE ${Table.user} (
             ${UserFeild.userId} INTEGER PRIMARY KEY AUTOINCREMENT,
             ${UserFeild.name} TEXT,${UserFeild.points} REAL,${UserFeild.email} TEXT,${UserFeild.membershipNo} TEXT, ${UserFeild.job} TEXT,
             ${UserFeild.gender} TEXT, ${UserFeild.status} TEXT, ${UserFeild.phone} TEXT, ${UserFeild.profilePic} TEXT)''');
      });
      return database;
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
