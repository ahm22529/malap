import 'package:flutter/material.dart';
import 'package:malab/component/custom_image_handler.dart';
import 'package:malab/core/utiles/app_styel.dart';

class CardTruns extends StatelessWidget {
  final Color color;

  CardTruns({super.key, required this.color});
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
          decoration: BoxDecoration(
              color: color,
              image: const DecorationImage(
                  image: AssetImage("assets/image/primlege.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          const Text("تفاصيل "),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.keyboard_arrow_right)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Prim leage",
                        style: AppStyles.f24600(context),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        const Positioned(
            top: -20,
            right: 0,
            child: CustomImageHandler("assets/image/Image.png"))
      ],
    );
  }
}
