import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/exceptions/server_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/services/notification_service/notification_service.dart';
import 'package:metrocoffee/core/sources/remote_source.dart';

class NotificationServiceImpl extends NotificationService {
  var remoteSource = locator.get<RemoteSource>();
  @override
  Future getNotifications({int? pageNumber}) async {
    try {
      var notifications = remoteSource.get("$baseUrl/api/notifications",
          queryParams: {"page": pageNumber ?? 1});
      return notifications;
    } on ServerException catch (e) {
      throw (AppException(message: e.message));
    }
  }
}
