import 'package:firebase_messaging/firebase_messaging.dart';

Future<bool> grantnotificationPermission() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    provisional: false,
    sound: true,
  );
  return settings.authorizationStatus == AuthorizationStatus.authorized;
}
