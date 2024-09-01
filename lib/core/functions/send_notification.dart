import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/functions/get_access_token.dart';
import 'package:permission_handler/permission_handler.dart';

class Notifications {
  final Dio _dio = Dio();

  Future<bool> sendNotification({
    required String title,
    required String body,
    required String imageLink,
  }) async {
    try {
      final String? serverToken = await getAccessToken();
      await _dio.post(
        'https://fcm.googleapis.com/v1/projects/mutamaruna2/messages:send',
        options: Options(
          headers: <String, String>{
            'Authorization': 'Bearer $serverToken',
          },
        ),
        data: {
          "message": {
            "topic": kNotificationPublicTopic,
            "notification": {"title": title, "body": body},
            "android": {
              "notification": {
                "image": imageLink,
                "notification_priority": "PRIORITY_MAX",
                "sound": "default"
              }
            },
            "apns": {
              "payload": {
                "aps": {
                  "content_available": true,
                }
              },
              "fcm_options": {
                "image": imageLink,
              }
            },
            "data": {
              "type": "type",
              "id": "userId",
              "click_action": "FLUTTER_NOTIFICATION_CLICK"
            }
          }
        },
      );
      return true;
    } on DioException {
      return false;
    }
  }

  Future<void> welcomeNotificationSend() async {
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
