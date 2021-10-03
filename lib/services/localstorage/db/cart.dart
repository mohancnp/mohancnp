import 'package:metrocoffee/services/localstorage/db/core.dart';
import 'package:sqflite/sqflite.dart';

class CartHandlerDB {
  CartHandlerDB._instance();

  static final CartHandlerDB _productService = CartHandlerDB._instance();

  factory CartHandlerDB.getInstance() {
    return _productService;
  }

  Future<int> addToCart(Map<String, dynamic> item) async {
    Database? db = await openDB();
    int status = -1;
    if (db != null) {
      try {
        status = await db.insert(cartTable, item);
        print("insert affected $status");
      } on Exception catch (e) {
        print("Error adding to cart ${e.toString()}");
      }
    }
    return status;
  }

  Future<int> removeFromCart(id) async {
    int status = 0;
    Database? db = await openDB();
    try {
      if (db != null) {
        status =
            await db.delete(cartTable, where: 'productId = ?', whereArgs: [id]);
        print('remove status $status');
      }
    } on Exception catch (e) {
      print("Error removing from the cart");
    }
    return status;
  }

  Future emptyCart() async {
    int status = -1;
    Database? db = await openDB();
    try {
      if (db != null) {
        status = await db.delete(cartTable);
        print('Number of data removed $status');
      }
    } on Exception catch (e) {
      print("Error removing from the cart");
    }
    return status;
  }

  Future<List<Map<String, dynamic>>> getCartProducts() async {
    Database? db = await openDB();
    List<Map<String, dynamic>> list = [];

    if (db != null) {
      try {
        list = await db.rawQuery("SELECT * from $cartTable");
      } catch (e) {
        print("Error loading the cart products from the database");
      }
    }
    return list;
  }

  Future<bool> getProductWithId(int productId) async {
    bool exists = false;
    Database? db = await openDB();
    if (db != null) {
      var data = await db.query(cartTable,
          columns: ['id', 'productId', 'price', 'variantId', 'qty', 'name'],
          where: 'productId = ?',
          whereArgs: [productId]);

      if (data.length > 0) {
        exists = !exists;
      }
    }
    return exists;
  }
}
