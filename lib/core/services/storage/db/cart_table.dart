import 'core.dart';
import 'package:sqflite/sqflite.dart';

import '../../../locator.dart';
import 'dbconst.dart';

class CartHandlerDB {
  Future<int> addToCart(Map<String, dynamic> item) async {
    Database db = locator<DbStorage>().db;
    int status = -1;
    try {
      int status = await db.insert(Table.cart, item);
      print("insert affected cart $status");
    } on Exception catch (e) {
      print("Error adding to cart ${e.toString()}");
    }
    return status;
  }

  Future<int> removeFromCart(id) async {
    int status = 0;
    Database db = locator<DbStorage>().db;

    try {
      status =
          await db.delete(Table.cart, where: 'productId = ?', whereArgs: [id]);
      print('remove status $status');
    } on Exception catch (e) {
      print("Error removing from the cart: $e");
    }
    return status;
  }

  Future emptyCart() async {
    Database db = locator<DbStorage>().db;
    try {
      var status = await db.delete(Table.cart);
      print('Number of data removed $status');
      return status;
    } on Exception catch (e) {
      print("Error removing from the cart $e");
    }
  }

  Future<List<Map<String, dynamic>>> getCartProducts() async {
    Database db = locator<DbStorage>().db;
    List<Map<String, dynamic>> list = [];

    try {
      list = await db.rawQuery("SELECT * from ${Table.cart}");
    } catch (e) {
      print("Error loading the cart products from the database");
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

    if (data.length > 0) {
      exists = !exists;
    }
    return exists;
  }

  Future updateCart(int variantId, int count) async {
    // print("Product Id received for update: $variantId");
    bool affected = false;
    Database db = locator<DbStorage>().db;
    try {
      var affectedRows = await db.rawUpdate(
          "UPDATE ${Table.cart} SET qty=$count where variantId=$variantId");
      // var elements=db.rawQuery("SELECT price, count from $cartTable where variantId=$variantId");
      if (affectedRows > 0) {
        affected = true;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return affected;
  }
}
