import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:malab/core/services/fcm/aswom_notifaxtion.dart';
import 'package:malab/core/utiles/global_key.dart';
import 'package:malab/fetures/auth/prsention/view/screen/log_in_screen.dart';

class FCMService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> init() async {
    // طلب الأذونات لإرسال الإشعارات
    await messaging.requestPermission();

    // الحصول على التوكن (المعرف الفريد للجهاز)
    String? token = await messaging.getToken();
    print("FCM Token: $token");

    // مستمع للإشعارات عند تلقيها عندما يكون التطبيق في المقدمة
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Message received: ${message.notification?.title}, ${message.notification?.body}");
      
      // التحقق من وجود العنوان والنص قبل عرض الإشعار
      AwesomeNotificationsHelper.showNotification(
        title: message.notification?.title ?? 'No Title',
        body: message.notification?.body ?? 'No Body',
        id: 0,
      );
    });

    // مستمع عند فتح التطبيق من إشعار (التطبيق في الخلفية)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message clicked!');
      
      // التحقق من وجود العنوان والنص قبل عرض الإشعار
      AwesomeNotificationsHelper.showNotification(
        title: message.notification?.title ?? 'No Title',
        body: message.notification?.body ?? 'No Body',
        id: 0,
      );
      
      _navigateToScreen(message);
    });

    // مستمع للإشعارات عندما يكون التطبيق مغلقًا أو في الخلفية
    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);
  }

  // دالة ثابتة (static) للتعامل مع الإشعارات في الخلفية
  static Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
    print('Background message received: ${message.notification?.title}');
    
    // التحقق من وجود العنوان والنص قبل عرض الإشعار
    AwesomeNotificationsHelper.showNotification(
      title: message.notification?.title ?? 'No Title',
      body: message.notification?.body ?? 'No Body',
      id: 0,
    );

    // إذا كانت البيانات تحتوي على نوع معين مثل chat، نقوم بالتنقل إلى الشاشة المطلوبة
    _navigateToScreen(message);
  }

  // التنقل إلى الشاشة المناسبة بناءً على البيانات
  static Future<void> _navigateToScreen(RemoteMessage message) async {
    Map<String, dynamic> data = message.data;
    
    // التحقق من وجود البيانات المناسبة قبل التنقل
    if (data['type'] == 'chat') {
      // التحقق من وجود currentState قبل محاولة التنقل
      if (GlobalKeys.navigatorKey.currentState != null) {
        GlobalKeys.navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (_) => LogInScreen(),
          ),
        );
      }
    }
  }
}
