import 'package:get_it/get_it.dart';
import 'package:metrocoffee/core/services/cart_service/cart_service.dart';
import 'package:metrocoffee/core/services/older/notification_service/notification_service.dart';
import 'package:metrocoffee/core/services/older/notification_service/notification_service_impl.dart';
import 'package:metrocoffee/core/services/older/order_service/order_service.dart';
import 'package:metrocoffee/core/services/older/order_service/order_service_impl.dart';
import 'package:metrocoffee/core/services/product_service/product_service_impl.dart';
import 'package:metrocoffee/core/services/older/profile_service/profile_service.dart';
import 'package:metrocoffee/core/services/storage/db/core.dart';
import 'package:metrocoffee/core/services/storage/db/user_table.dart';
import 'package:metrocoffee/core/services/storage/sharedpref/temp_storage.dart';
import 'package:metrocoffee/core/services/product_service/product_service.dart';
import 'package:metrocoffee/core/sources/source_impl/remote_source_impl.dart';
import 'services/auth_service/auth_service.dart';
import 'services/auth_service/auth_service_impl.dart';
import 'services/cart_service/cart_service_impl.dart';
import 'services/older/profile_service/profile_service_impl.dart';
import 'sources/remote_source.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerSingletonAsync<TempStorage>(() async {
    final service = TempStorage();
    await service.initialise();
    return service;
  });

  locator.registerSingletonAsync<DbStorage>(() async {
    final storageService = DbStorage();
    await storageService.openDB();
    return storageService;
  });

  locator.isReady<TempStorage>().whenComplete(
    () {
      locator.registerLazySingleton<RemoteSource>(() => RemoteSourceImpl());
      locator.registerLazySingleton<ProductService>(
          () => ProductServiceImpl(locator.get()));
      locator.registerSingleton<AuthService>(AuthServiceImpl(locator.get()));
      locator.registerLazySingleton<OrderService>(() => OrderServiceImpl());

      locator.registerLazySingleton<ProfileService>(() => ProfileServiceImpl());
      locator.registerLazySingleton<NotificationService>(
          () => NotificationServiceImpl());
    },
  );
  locator.isReady<DbStorage>().whenComplete(() {
    locator.registerLazySingleton<CartService>(() => CartServiceImpl());
    locator.registerLazySingleton<UserTableHandler>(() => UserTableHandler());
  });

  await locator.allReady();
}
