import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:malab/fetures/onbording/presenention/view/screen/onbording_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/jason/splash.json',
          onLoaded: (composition) {
            Future.delayed(composition.duration, () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const OnbordingScreen()),
              );
            });
          },
        ),
      ),
    );
  }
}
