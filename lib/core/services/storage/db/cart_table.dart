import 'core.dart';
import 'package:sqflite/sqflite.dart';

import '../../../locator.dart';
import 'dbconst.dart';

class CartHandlerDB {
  Future<int> addToCart(Map<String, dynamic> item) async {
    Database db = locator<DbStorage>().db;
    int status = -1;
    try {
      await db.insert(Table.cart, item);
    } on Exception {
      // TODO: Handle Exception
    }
    return status;
  }

  Future<int> removeFromCart(id) async {
    int status = 0;
    Database db = locator<DbStorage>().db;

    try {
      status =
          await db.delete(Table.cart, where: 'productId = ?', whereArgs: [id]);
    } on Exception {
      // TODO: Handle Exception
    }
    return status;
  }

  Future emptyCart() async {
    Database db = locator<DbStorage>().db;
    try {
      var status = await db.delete(Table.cart);
      return status;
    } on Exception {
      // TODO: Handle Exception
    }
  }

  Future<List<Map<String, dynamic>>> getCartProducts() async {
    Database db = locator<DbStorage>().db;
    List<Map<String, dynamic>> list = [];

    try {
      list = await db.rawQuery("SELECT * from ${Table.cart}");
    } catch (e) {
      // TODO: Handle Exception
    }
    return list;
  }

  Future<bool> getProductWithId(int productId) async {
    bool exists = false;
    Database db = locator<DbStorage>().db;
    var data = await db.query(Table.cart,
        columns: ['id', 'productId', 'price', 'variantId', 'qty', 'name'],
        where: 'productId = ?',
        whereArgs: [productId]);

    if (data.isNotEmpty) {
      exists = !exists;
    }
    return exists;
  }

  Future updateCart(int variantId, int count) async {
    bool affected = false;
    Database db = locator<DbStorage>().db;
    try {
      var affectedRows = await db.rawUpdate(
          "UPDATE ${Table.cart} SET qty=$count where variantId=$variantId");
      // var elements=db.rawQuery("SELECT price, count from $cartTable where variantId=$variantId");
      if (affectedRows > 0) {
        affected = true;
      }
    } on Exception {
      // TODO: Handle Exception
    }
    return affected;
  }
}
