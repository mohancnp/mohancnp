import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
Future<void> setupLocator() async {
  // locator.registerSingleton(NavigationService());
  // locator.registerSingleton<AuthService>(AuthServiceImpl());

  // locator.registerSingletonAsync(() async {
  //   final service = SecureStore();
  //   await service.initialise();
  //   return service;
  // });

  await locator.allReady();
}
