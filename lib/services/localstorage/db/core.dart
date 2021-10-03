import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

var cartTable = "cart";

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
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE Cart (id INTEGER PRIMARY KEY AUTOINCREMENT, productId INTEGER,price REAL,variantId INTEGER, qty INTEGER,name TEXT,imageUri TEXT,options TEXT, addons TEXT)');
      });

      return database;
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
