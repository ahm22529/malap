import 'package:flutter/material.dart';
import 'package:malab/core/utiles/app_styel.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "مرحبا ",
          style: AppStyles.f24600(context)
              .copyWith(color: Color(0xff000000), fontWeight: FontWeight.w400),
        ),
        Row(
          children: [
            Text(
              "احمد اسامه",
              style:
                  AppStyles.f24600(context).copyWith(color: Color(0xff000000)),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffFF4B00),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
