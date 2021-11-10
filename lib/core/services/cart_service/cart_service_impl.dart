import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/services/cart_service/cart_service.dart';
import 'package:metrocoffee/core/services/storage/db/core.dart';
import 'package:metrocoffee/core/services/storage/db/dbfeilds.dart';

import '../../locator.dart';

class CartServiceImpl extends CartService {
  @override
  Future<int> addProductToCart(Map<String, dynamic> product) async {
    var db = locator<DbStorage>().db;

    try {
      var data = await db.query(Table.cart,
          columns: ['id', 'productId', 'price', 'variantId', 'qty', 'name'],
          where: 'productId = ?',
          whereArgs: [product['productId']]);
      var count;
      if (data.length > 0) {
        //update
        count = db.update(Table.cart, product);
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
      print('removed item $count');
      return count;
    } on Exception catch (e) {
      print("Error $e");
      throw (AppException());
    }
  }
}
