import 'dart:convert';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class Notifications {
  String serverToken = '';

  Future<bool> sendNotification(
    String title,
    String body,
    String category,
    String imageLink,
    String date,
  ) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverToken',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': body.toString(),
              'title': title.toString(),
              'imageUrl': imageLink,
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'imageLink': imageLink.toString(),
              'Date': date.toString(),
              'category': category.toString()
            },
            'to': "/topics/$kNotificationPublicTopic",
          },
        ),
      );
      return true;
    } on Exception {
      return false;
    }
  }

  welcomeNotificationSend() async {
    PermissionStatus status = await Permission.notification.status;
    bool granted = false;

    if (status.isGranted) {
      granted = true;
    } else {
      PermissionStatus status = await Permission.notification.request();

      if (status.isGranted) {
        granted = true;
      } else if (status.isDenied) {
        granted = false;
        AwesomeNotifications().requestPermissionToSendNotifications();
      } else if (status.isPermanentlyDenied) {
        granted = false;
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    }

    //welcome local notification
    if (granted) {
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: _createUniqueId(),
          channelKey: 'Firebase_Notification',
          title:
              '${Emojis.hand_clapping_hands + Emojis.emotion_heart_decoration} ',
          body: '',
          bigPicture: 'asset://images/welcome.png',
          notificationLayout: NotificationLayout.BigPicture,
          criticalAlert: true,
          wakeUpScreen: true,
        ),
      );
    }
  }

  int _createUniqueId() {
    DateTime now = DateTime.now();
    int milliseconds = now.millisecondsSinceEpoch;
    return milliseconds;
  }

  Future<void> subscribeToGeneralTopic() async {
    FirebaseMessaging fBM = FirebaseMessaging.instance;
    await fBM.subscribeToTopic(kNotificationPublicTopic);
  }
}
