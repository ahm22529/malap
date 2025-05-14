import 'package:flutter/material.dart';
import 'package:malab/core/utiles/app_styel.dart';

class ShowMore extends StatelessWidget {
  final String titel;
  final void Function()? onTap;

  const ShowMore({super.key, required this.titel, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titel,
          style: AppStyles.f19700(context).copyWith(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        Spacer(),
        GestureDetector(
            onTap: onTap,
            child: Text(
              "عرض المزيد",
              style: AppStyles.f19700(context).copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.orange),
            ))
      ],
    );
  }
}
