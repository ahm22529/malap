import 'dart:convert';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:malab/core/utiles/global_key.dart';
import 'package:malab/fetures/auth/prsention/view/screen/log_in_screen.dart';

class AwesomeNotificationsHelper {
  static AwesomeNotifications awesomeNotifications = AwesomeNotifications();

  static init() async {
    await _initNotification();
    awesomeNotifications.requestPermissionToSendNotifications();
    listenToActionButtons();
  }

  static listenToActionButtons() {
    awesomeNotifications.setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
  }

  static _initNotification() async {
    await awesomeNotifications.initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: NotificationChannels.generalChannelGroupKey,
          channelKey: NotificationChannels.generalChannelKey,
          channelName: NotificationChannels.generalChannelName,
          groupKey: NotificationChannels.generalGroupKey,
          channelDescription: NotificationChannels.generalChannelDescription,
          defaultColor: Colors.green,
          ledColor: Colors.white,
          channelShowBadge: true,
          playSound: true,
          importance: NotificationImportance.Max,
        ),
        NotificationChannel(
          channelGroupKey: NotificationChannels.chatChannelGroupKey,
          channelKey: NotificationChannels.chatChannelKey,
          channelName: NotificationChannels.chatChannelName,
          groupKey: NotificationChannels.chatGroupKey,
          channelDescription: NotificationChannels.chatChannelDescription,
          defaultColor: Colors.green,
          ledColor: Colors.white,
          channelShowBadge: true,
          playSound: true,
          importance: NotificationImportance.Max,
        )
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: NotificationChannels.generalChannelGroupKey,
          channelGroupName: NotificationChannels.generalChannelGroupName,
        ),
        NotificationChannelGroup(
          channelGroupKey: NotificationChannels.chatChannelGroupKey,
          channelGroupName: NotificationChannels.chatChannelGroupName,
        )
      ],
    );
  }

  static showNotification({
    required String title,
    required String body,
    required int id,
    String? channelKey,
    String? groupKey,
    NotificationLayout? notificationLayout,
    String? summary,
    List<NotificationActionButton>? actionButtons,
    Map<String, String>? payload,
    String? largeIcon,
  }) async {
    awesomeNotifications.isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        awesomeNotifications.requestPermissionToSendNotifications();
      } else {
        awesomeNotifications.createNotification(
          content: NotificationContent(
            id: id,
            title: title,
            body: body,
            groupKey: groupKey ?? NotificationChannels.generalGroupKey,
            channelKey: channelKey ?? NotificationChannels.generalChannelKey,
            showWhen: true,
            payload: payload,
            notificationLayout:
                notificationLayout ?? NotificationLayout.Default,
            autoDismissible: true,
            summary: summary,
            largeIcon: largeIcon,
          ),
          actionButtons: actionButtons,
        );
      }
    });
  }
}

class NotificationController {
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {}

  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {}

  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {}

  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    Map<String, String?>? payload = receivedAction.payload;
    if (payload != null) {
      if (receivedAction.buttonKeyPressed == "") {
        if (payload['type'] == 'chat' && payload['chat'] != null) {
          final chat = jsonDecode(payload['chat']!);
          // To handle navigation without GetX, you'll need to use a service or pass context via another way.
          // You can use a navigatorKey (e.g., GlobalKey<NavigatorState>) or context passed from outside.
          // Example with navigatorKey:
          GlobalKeys.navigatorKey.currentState?.push(
            MaterialPageRoute(
              builder: (_) => LogInScreen(),
            ),
          );
        }
      }
    }
  }
}

class NotificationChannels {
  static String get chatChannelKey => "chat_channel";
  static String get chatChannelName => "Chat channel";
  static String get chatGroupKey => "chat group key";
  static String get chatChannelGroupKey => "chat_channel_group";
  static String get chatChannelGroupName => "Chat notifications channels";
  static String get chatChannelDescription => "Chat notifications channels";

  static String get generalChannelKey => "general_channel";
  static String get generalGroupKey => "general group key";
  static String get generalChannelGroupKey => "general_channel_group";
  static String get generalChannelGroupName => "general notifications channel";
  static String get generalChannelName => "general notifications channels";
  static String get generalChannelDescription =>
      "Notification channel for general notifications";
}
