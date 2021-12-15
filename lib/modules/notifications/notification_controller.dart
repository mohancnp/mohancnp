import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/core/models/older/notification_model.dart';

class NotificationController extends GetxController {
  DataState _dataState = DataState.NA;
  List<Notification> _notifications = <Notification>[];

  Future getAllNotifications({int pageNumber = 1}) async {
    //TODO GET NOTIFICATION FROM SERVER
  }
  List<Notification> get notifications {
    return this._notifications;
  }

  DataState get dataState {
    return this._dataState;
  }

  set dataState(ds) {
    _dataState = ds;
    update();
  }

  set notifications(ns) {
    _notifications = ns;
    update();
  }
}
