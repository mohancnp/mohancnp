import 'package:dartz/dartz.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/models/category.dart';
import 'package:metrocoffee/core/models/product_detail_model.dart';
import 'package:metrocoffee/core/models/product_model.dart';

abstract class ProductService {
  Future handleProductsOfType({required String type});
  Future handleAllProducts();
  Future handleProductDetail({required int id});
  Future getFavoriteProducts();
  Future toggleFavoriteProduct({required int id});
  Future getPublicProducts();
  Future getPublicProductsOfType({required String type});
  Future getPublicProductDetail({required int id});
  Future<Either<List<Category>, Failure>> getCatoriesList();
  Future<Either<CategoryProduct, Failure>> getProductForCategory(
      {required int id});
  Future<Either<ProductDetail,Failure>>getProductDetailWithId(int id);      
}
