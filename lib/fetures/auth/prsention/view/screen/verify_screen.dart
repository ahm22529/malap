import 'package:flutter/material.dart';
import 'package:malab/core/utiles/app_styel.dart';
import 'package:malab/fetures/auth/prsention/view/widget/pin_code_widget.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Text(
              "ادخال الكود المرسل لك على رقم 010215######0",
              style: AppStyles.f24600(context)
                  .copyWith(color: Colors.black54, fontSize: 16),
            ),
            PinCodeWidget(
              length: 5,
            ),
          ],
        ),
      ),
    );
  }
}
