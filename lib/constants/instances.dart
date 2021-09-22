import 'package:metrocoffee/services/rest/products.dart';
import 'package:metrocoffee/services/rest/single_product.dart';
import 'package:metrocoffee/services/localstorage/db/cart.dart';

//rest instances
ProductService productService=ProductService.getInstance();
SingleProductService singleProductService=SingleProductService.getInstance();
//db instances

CartHandlerDB cartHandlerDB = CartHandlerDB.getInstance();
