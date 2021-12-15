class Notification {
  String id;
  dynamic readAt;
  String createdAt;
  String updateAt;
  NotificationData notificationData;
  Notification({
    required this.id,
    this.readAt,
    required this.createdAt,
    required this.updateAt,
    required this.notificationData,
  });
  factory Notification.fromJson(Map<String, dynamic> data) {
    NotificationData nfd = NotificationData.fromJson(data["data"]);
    return Notification(
      createdAt: data['created_at'],
      readAt: data['read_at'],
      updateAt: data['updated_at'],
      id: data["id"],
      notificationData: nfd,
    );
  }
}

class NotificationData {
  String title, body;
  NestedNotificationData? nestedData;
  NotificationData({required this.title, required this.body, this.nestedData});
  factory NotificationData.fromJson(Map<String, dynamic> data) {
    NestedNotificationData nestedData =
        NestedNotificationData.fromJson(data["data"]);
    return NotificationData(
      title: data["title"],
      body: data["body"],
      nestedData: nestedData,
    );
  }
}

class NestedNotificationData {
  String? type;
  String? image;
  NestedNotificationData({this.type, this.image});
  factory NestedNotificationData.fromJson(Map<String, dynamic> data) {
    return NestedNotificationData(
      type: data["type"],
      image: data["image"],
    );
  }
}
