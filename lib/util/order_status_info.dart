import 'package:metrocoffee/core/constants/order_status.dart';

String getStatusStringForId(int id) {
  // print(id);
  switch (id) {
    case 1:
      return OrderStatus.pending;
    case 2:
      return OrderStatus.processing;
    default:
      return OrderStatus.delivered;
  }
}
