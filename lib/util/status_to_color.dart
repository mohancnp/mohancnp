import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/order_status.dart';

Color getBorderColorAccordingToStatus(String orderStatus) {
  switch (orderStatus) {
    case OrderStatus.delivered:
      return Colors.greenAccent;
    case OrderStatus.processing:
      return Colors.red;
    default:
      return Colors.blueAccent;
  }
}
