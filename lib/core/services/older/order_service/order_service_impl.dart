import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/exceptions/server_exceptions.dart';
import 'order_service.dart';
import 'package:metrocoffee/core/sources/source_impl/remote_source_impl.dart';
import 'package:metrocoffee/core/config.dart';

/*TODO: this file will be modified with the new api later on*/
class OrderServiceImpl extends OrderService {
  @override
  Future createOrder(Map<String, dynamic> data) async {
    var remoteSource = RemoteSourceImpl();

    try {
      Map<String, dynamic> afterOrder =
          await remoteSource.post('${AppConfig.baseUrl}/api/order', body: data);
      return afterOrder;
      // print(afterOrder);
    } on ServerException catch (e) {
      throw ServerException(code: e.code, message: e.message);
    }
  }

  @override
  Future getAllOrder() async {
    var remoteSource = RemoteSourceImpl();
    try {
      var orders = await remoteSource.get('${AppConfig.baseUrl}/api/order');
      return orders;
    } on ServerException catch (e) {
      throw (AppException(message: e.message));
    }
  }

  @override
  Future getOrderDetailWithId({required int id}) async {
    var remoteSource = RemoteSourceImpl();
    try {
      var orderDetail =
          await remoteSource.get('${AppConfig.baseUrl}/api/order/$id');
      return orderDetail;
    } on ServerException catch (e) {
      throw (AppException(message: e.message));
    }
  }

  @override
  Future cancelOrderWithId({required int id}) async {
    var remoteSource = RemoteSourceImpl();
    try {
      var orderCancelStatus =
          await remoteSource.post('${AppConfig.baseUrl}/api/order/$id/cancel');
      return orderCancelStatus;
    } on ServerException catch (e) {
      throw (AppException(message: e.message));
    }
  }

  @override
  Future reorderWithOrderId({required int id}) async {
    var remoteSource = RemoteSourceImpl();
    try {
      var reorderStatus = await remoteSource.post(
          '${AppConfig.baseUrl}/api/order/reorder',
          body: {"order_id": id});
      return reorderStatus;
    } on ServerException catch (e) {
      throw (AppException(message: e.message));
    }
  }
}
