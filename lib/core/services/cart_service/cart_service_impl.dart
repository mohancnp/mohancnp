import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/services/cart_service/cart_service.dart';
import 'package:metrocoffee/core/services/storage/db/core.dart';
import 'package:metrocoffee/core/services/storage/db/dbfeilds.dart';

import '../../locator.dart';

class CartServiceImpl extends CartService {
  @override
  Future<int> addProductToCart(Map<String, dynamic> product) async {
    var db = locator<DbStorage>().db;
    // print("product in cart service: $product");

    try {
      var data = await db.query(Table.cart,
          columns: [
            CartFeild.id,
            CartFeild.productId,
            CartFeild.price,
            CartFeild.variantId,
            CartFeild.qty,
            CartFeild.name,
          ],
          where: '${CartFeild.productId} = ?',
          whereArgs: [product[CartFeild.productId]]);
      // print("product count $data");
      var count;
      if (data.length > 0) {
        //update
        // where: '$columnId = ?', whereArgs: [todo.id]
        count = db.update(
          Table.cart,
          product,
          where: "${CartFeild.productId} = ?",
          whereArgs:[product[CartFeild.productId]] 
        );
      } else {
        //insert
        count = await db.insert(Table.cart, product);
      }
      return count;
    } on Exception catch (e) {
      print("add update cart error $e");
      throw (AppException());
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getCartProducts() async {
    List<Map<String, dynamic>> list = [];
    var db = locator<DbStorage>().db;

    try {
      list = await db.rawQuery("SELECT * from ${Table.cart}");
      return list;
    } on Exception catch (e) {
      print("Error loading the cart products from the database $e");
      throw (AppException());
    }
  }

  @override
  Future removeProductWithId(int id) async {
    var db = locator<DbStorage>().db;
    try {
      var count =
          await db.delete(Table.cart, where: 'productId = ?', whereArgs: [id]);
      // print('removed item $count');
      return count;
    } on Exception catch (e) {
      print("Error $e");
      throw (AppException());
    }
  }

  @override
  Future<int> clearCart() async {
    var db = locator<DbStorage>().db;
    try {
      var status = await db.delete(Table.cart);
      return status;
    } on Exception catch (e) {
      print("Error $e");
      throw (AppException());
    }
  }
}
