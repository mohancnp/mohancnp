import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/product_type.dart';
import 'package:metrocoffee/core/enums/producttype.dart';
import 'package:metrocoffee/core/exceptions/server_exceptions.dart';
import 'package:metrocoffee/core/models/product_model.dart';
import 'package:metrocoffee/core/sources/remote_source.dart';
import 'package:metrocoffee/core/sources/source_impl/remote_source_impl.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';
import '../../config.dart';
import '../../locator.dart';
import 'product_service.dart';

class ProductServiceImpl extends ProductService {
  @override
  Future handleProductsOfType({required String type}) async {
    // '$baseUrl/api/product', queryParameters: {"type": type}
    var remoteSource = RemoteSourceImpl();
    try {
      Map<String, dynamic> products = await remoteSource
          .get('$baseUrl/api/product', queryParams: {"type": type});
      Get.find<HomeTabController>()
          .differentiateProductsTypeAndNotifyController(type, products);
    } on ServerException catch (e) {
      throw ServerException(code: e.code, message: e.message);
    }
  }

  @override
  Future handleAllProducts() async {
    var remoteSource = RemoteSourceImpl();
    try {
      Map<String, dynamic> products =
          await remoteSource.get('$baseUrl/api/product');
      Get.find<HomeTabController>()
          .differentiateProductsTypeAndNotifyController("All", products);
    } on ServerException catch (e) {
      throw ServerException(code: e.code, message: e.message);
    }
  }
}
