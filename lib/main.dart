import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:malab/core/services/fcm/aswom_notifaxtion.dart';
import 'package:malab/core/services/fcm/fcm_services.dart';
import 'package:malab/core/services/get_it/get_it_services.dart';
import 'package:malab/fetures/booking/presention/view/screen/booking_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AwesomeNotificationsHelper.init();
  FCMService().init();
  
  
  await initializeDateFormatting('ar', null); // <-- مهم جداً

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
      home: BookingScreen(),
    );
  }
}
