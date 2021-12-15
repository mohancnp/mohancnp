import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/services/older/notification_service/notification_service.dart';
import 'package:metrocoffee/core/sources/remote_source.dart';

class NotificationServiceImpl extends NotificationService {
  final _remoteSource = locator.get<RemoteSource>();
  @override
  Future<void> getNotifications({int pageNumber = 1}) async {
    throw UnimplementedError();
  }
}
