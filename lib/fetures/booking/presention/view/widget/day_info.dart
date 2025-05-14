import 'package:flutter/material.dart';
import 'package:malab/core/utiles/app_styel.dart';
import 'package:intl/intl.dart';

class DayInfo extends StatelessWidget {
  const DayInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          DateFormat.yMMMMEEEEd('ar').format(DateTime.now()),
          style: AppStyles.f24600(context).copyWith(color: Color(0xff000000)),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
              color: Color(0xffFF4B00), borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Icon(
              Icons.calendar_month,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
