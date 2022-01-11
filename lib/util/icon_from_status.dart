import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/order_status.dart';

IconData getIconAccordingToStatus(String orderStatus) {
  switch (orderStatus) {
    case OrderStatus.delivered:
      return Icons.done;
    case OrderStatus.processing:
      return Icons.cancel_rounded;
    default:
      return Icons.dangerous;
  }
}
