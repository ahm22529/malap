import 'package:flutter/material.dart';
import 'package:malab/component/custom_button.dart';
import 'package:malab/core/utiles/app_images.dart';
import 'package:malab/fetures/onbording/presenention/view/widget/iteam_page_view.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text("تخطي"),
                ),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              children: [
                const ItemPageView(
                  titel: "احجز ملعبك بسهولة",
                  sub:
                      "شوف المواعيد المتاحة واحجز في ثواني بدون ما تتصل أو تروح للمكان",
                  image: AppImages.logo,
                ),
                const ItemPageView(
                  titel: "اختار الميعاد اللي يناسبك",
                  sub: "كل المواعيد قدامك مباشرة، اختار الوقت اللي تحبه واحجزه",
                  image: AppImages.logo,
                ),
                const ItemPageView(
                  titel: "",
                  sub: "",
                  image: AppImages.logo,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: CustomButton(text: "التالي", onTap: () {}),
          )
        ],
      ),
    );
  }
}
