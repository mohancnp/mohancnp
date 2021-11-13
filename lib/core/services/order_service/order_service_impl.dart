import 'package:metrocoffee/core/exceptions/server_exceptions.dart';
import 'package:metrocoffee/core/services/order_service/order_service.dart';
import 'package:metrocoffee/core/sources/source_impl/remote_source_impl.dart';

import '../../config.dart';
import 'order_service.dart';

class OrderServiceImpl extends OrderService {
  @override
  Future createOrder(Map<String, dynamic> data) async {
    var remoteSource = RemoteSourceImpl();

    try {
      Map<String, dynamic> afterOrder =
          await remoteSource.post('$baseUrl/api/order', body: data);
      return afterOrder;
      // print(afterOrder);
    } on ServerException catch (e) {
      throw ServerException(code: e.code, message: e.message);
    }
  }
}
