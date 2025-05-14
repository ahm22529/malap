import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:malab/core/services/fcm/aswom_notifaxtion.dart';
import 'package:malab/core/services/fcm/fcm_services.dart';
import 'package:malab/core/services/get_it/get_it_services.dart';
import 'package:malab/core/utiles/global_key.dart';

import 'package:malab/fetures/splash/presention/view/screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AwesomeNotificationsHelper.init();
  FCMService().init();
  setupGetit();

  runApp(const Malab());
}

class Malab extends StatelessWidget {
  const Malab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "cairo",
      ),
      locale: const Locale("ar"),
      supportedLocales: const [
        Locale("ar"),
      ],
      navigatorKey: GlobalKeys.navigatorKey,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const SplashScreen(),
    );
  }
}
