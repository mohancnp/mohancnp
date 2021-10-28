import 'package:metrocoffee/services/localstorage/db/user.dart';
import 'package:metrocoffee/services/rest/address.dart';
import 'package:metrocoffee/services/rest/order.dart';
import 'package:metrocoffee/services/rest/products.dart';
import 'package:metrocoffee/services/rest/profile.dart';
import 'package:metrocoffee/services/rest/registeruser.dart';
import 'package:metrocoffee/services/rest/single_product.dart';
import 'package:metrocoffee/services/localstorage/db/cart.dart';

//rest instances
final ProductService productService = ProductService.getInstance();
final SingleProductService singleProductService =
    SingleProductService.getInstance();
final ProfileService profileService = ProfileService.getInstance();
final OrderService orderService = OrderService.getInstance();
final RegisterUser registerService = RegisterUser.getInstance();
final AddressService addressService = AddressService.getInstance();
//db instances
final CartHandlerDB cartHandlerDB = CartHandlerDB.getInstance();
final UserTableHandler userTableHandler = UserTableHandler.getInstance();
