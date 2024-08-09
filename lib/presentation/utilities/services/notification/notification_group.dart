import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationGroup {
  NotificationGroup._();

  static const String groupId = 'general';
  static const String groupName = 'General';
  static const String groupDescription =
      'This group is used for general notifications.';

  static const AndroidNotificationChannelGroup androidGeneralGroup =
      AndroidNotificationChannelGroup(
    groupId,
    groupName,
    description: groupDescription,
  );
}
