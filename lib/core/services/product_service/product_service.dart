import 'package:dartz/dartz.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/models/category.dart';
import 'package:metrocoffee/core/models/filter.dart';
import 'package:metrocoffee/core/models/product_detail.dart';
import 'package:metrocoffee/core/models/product.dart';

abstract class ProductService {
  Future<Either<List<Category>, Failure>> getCatoriesList();
  Future<Either<CategoryProduct, Failure>> getProductForCategory(
      {required int id});
  Future<Either<ProductDetail, Failure>> getProductDetailWithId(int id);
  Future<Either<FilterProduct, Failure>> getFilteredList(String filter);
}
