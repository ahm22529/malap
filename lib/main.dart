import 'package:flutter/material.dart';
import 'package:malab/fetures/splash/presention/view/screen/splash_screen.dart';

void main() {
  runApp(const Malab());
}

class Malab extends StatelessWidget {
  const Malab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "cairo",
       
      ),
      home: const SplashScreen(),
    );
  }
}
