import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:malab/fetures/splash/presention/view/screen/splash_screen.dart';

void main() {
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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const SplashScreen(),
    );
  }
}
