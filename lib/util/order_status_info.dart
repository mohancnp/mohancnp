import 'package:metrocoffee/core/constants/order_status.dart';

String getStatusStringForId(int id) {
  // print(id);
  switch (id) {
    case 1:
      return OrderStatus.received;
    case 2:
      return OrderStatus.processing;
    case 3:
      return OrderStatus.onHold;
    case 4:
      return OrderStatus.cancelled;
    case 5:
      return OrderStatus.delivered;
    default:
      return OrderStatus.failed;
  }
}
