import 'dart:io';

import 'package:example_flutter_app/core/infrastructure/services/local/notification/notification_channel.dart';
import 'package:example_flutter_app/core/infrastructure/services/local/notification/notification_group.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  NotificationService._internal();
  static NotificationService get instance => _instance;
  static final NotificationService _instance = NotificationService._internal();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize({
    Function(int, String?, String?, String?)? onDidReceiveLocalNotification,
    Function(NotificationResponse)? onDidReceiveNotificationResponse,
  }) async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettingsDarwin = DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    await configChannel();
  }

  Future<void> configChannel() async {
    if (Platform.isAndroid) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannelGroup(
            NotificationGroup.androidGeneralGroup,
          );

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(
            NotificationChannel.androidCommonChannel,
          );
    }
  }

  Future<void> showCommonNotification({
    required String payload,
    required int hashCode,
    String? icon,
    String? title,
    String? message,
  }) async {
    final androidNotificationDetails = AndroidNotificationDetails(
      NotificationChannel.channelId,
      NotificationChannel.channelName,
      channelDescription: NotificationChannel.channelDescription,
      icon: icon,
      importance: Importance.high,
      priority: Priority.high,
      groupKey: NotificationChannel.groupId,
    );

    const darwinNotificationDetails = DarwinNotificationDetails(
      threadIdentifier: NotificationChannel.groupId,
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    final notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
      macOS: darwinNotificationDetails,
    );
    await flutterLocalNotificationsPlugin.show(
      hashCode,
      title,
      message,
      notificationDetails,
      payload: payload,
    );
  }
}
