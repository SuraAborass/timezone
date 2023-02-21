import 'dart:convert';
import '../Clients/notification_client.dart';
import '../Models/notification.dart';


class NotificationRepo{
  var client = NotificationClient();

  Future<List<UserNotification>> getNotifications(userId) async {
    var response = await client.getNotifications(userId);
    if (response.isNotEmpty) {
      final myNotifications = json.decode(response).cast<Map<String, dynamic>>();
      return myNotifications
          .map<UserNotification>((json) => UserNotification.fromMap(json))
          .toList();
    }
    return [];
  }
}