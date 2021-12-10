import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/older/notification_model.dart';
import 'package:metrocoffee/core/services/older/notification_service/notification_service.dart';

class NotificationController extends GetxController {
  DataState _dataState = DataState.NA;
  List<Notification> _notifications = <Notification>[];
  var _notificationService = locator<NotificationService>();
  set notifications(ns) {
    _notifications = ns;
    update();
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

  Future getAllNotifications({int pageNumber = 1}) async {
    // print("called");
    notifications.clear();
    _dataState = DataState.loading;
    try {
      var response =
          await _notificationService.getNotifications(pageNumber: pageNumber);
      if (response is Map<String, dynamic>) {
        List<dynamic> notifData = response["data"]["data"];
        List<Notification> notfs = <Notification>[];
        notifData.forEach((element) {
          print(element);

          var notification = Notification.fromJson(element);
          notfs.add(notification);
        });
        notifications = notfs;
        if (notifications.length > 0) {
          _dataState = DataState.loaded;
        } else {
          _dataState = DataState.NA;
        }
      }
    } on AppException catch (e) {
      dataState = DataState.error;
      print(e.message);
    } on Exception catch (e) {
      print(e);
      dataState = DataState.error;
    }
  }
}
