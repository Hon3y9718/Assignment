import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationAPI {
  final FlutterLocalNotificationsPlugin notification =
      FlutterLocalNotificationsPlugin();

  final BehaviorSubject onNotification = BehaviorSubject<String?>();

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channel id', 'channel name',
            channelDescription: 'channel description',
            icon: '@mipmap/ic_launcher',
            importance: Importance.max),
        iOS: IOSNotificationDetails());
  }

  Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    notification.show(id, title, body, notificationDetails(), payload: payload);
  }

  Future init({bool initSchedule = false}) async {
    const android = AndroidInitializationSettings("@mipmap/ic_launcher");
    const iOS = IOSInitializationSettings();

    const settings = InitializationSettings(android: android, iOS: iOS);

    await notification.initialize(settings,
        onSelectNotification: ((payload) async {
      onNotification.add(payload);
    }));
  }
}
