import 'package:get_it/get_it.dart';
import 'package:metrocoffee/core/services/product_service/product_service_impl.dart';
import 'package:metrocoffee/core/services/storage/db/core.dart';
import 'package:metrocoffee/core/services/storage/db/user_table.dart';
import 'package:metrocoffee/core/services/storage/sharedpref/temp_storage.dart';
import 'package:metrocoffee/core/services/product_service/product_service.dart';
import 'services/auth_service/auth_service.dart';
import 'services/auth_service/auth_service_impl.dart';

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
  locator.registerSingleton<AuthService>(AuthServiceImpl());
  locator.registerSingleton<UserTableHandler>(UserTableHandler());
  locator.registerSingleton<ProductService>(ProductServiceImpl());
  await locator.allReady();
}
