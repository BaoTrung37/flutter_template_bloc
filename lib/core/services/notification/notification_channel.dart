import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationChannel {
  NotificationChannel._();
  static const String groupId = 'general';

  static const String channelId = 'common';
  static const String channelName = 'Common';
  static const String channelDescription =
      'This channel is used for common notifications.';

  static const AndroidNotificationChannel androidCommonChannel =
      AndroidNotificationChannel(
    channelId,
    channelName,
    description: channelDescription,
    groupId: groupId,
    importance: Importance.high,
  );
}
