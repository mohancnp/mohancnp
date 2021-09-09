import 'package:get_it/get_it.dart';
import 'package:metrocoffee/services/api_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator(

    ) async {
  locator.registerSingleton<ApiService>(ApiService());

}