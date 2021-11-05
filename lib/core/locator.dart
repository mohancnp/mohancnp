import 'package:get_it/get_it.dart';
import 'package:metrocoffee/core/services/storage/db/core.dart';
import 'package:metrocoffee/core/services/storage/db/user_table.dart';
import 'package:metrocoffee/core/services/storage/sharedpref/temp_storage.dart';

import 'services/rest/auth_service/auth_service.dart';
import 'services/rest/auth_service/auth_service_impl.dart';

GetIt locator = GetIt.instance;
Future<void> setupLocator() async {
  locator.registerSingleton<AuthService>(AuthServiceImpl());
  locator.registerSingleton<UserTableHandler>(UserTableHandler());

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

  await locator.allReady();
}
