import 'package:flutter/material.dart';
import 'package:malab/component/custom_image_handler.dart';
import 'package:malab/core/utiles/app_styel.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 4,
                spreadRadius: -3)
          ]),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NameAndVule(
                name: 'الاسم',
                value: 'احمد اسامه',
              ),
              SizedBox(
                height: 8,
              ),
              NameAndVule(
                name: 'من',
                value: "1",
              ),
              SizedBox(
                height: 8,
              ),
              NameAndVule(
                name: 'الي',
                value: "2",
              )
            ],
          ),
          Spacer(),
          CustomImageHandler(
            "assets/image/sports_soccer.png",
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

class NameAndVule extends StatelessWidget {
  const NameAndVule(
      {super.key,
      required this.name,
      required this.value,
      this.isTime = false});
  final String name, value;
  final bool isTime;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: AppStyles.f13700(context).copyWith(color: Colors.black45),
        ),
        Text(
          ":$value",
          style: AppStyles.f13700(context).copyWith(color: Colors.black),
        ),
        if (isTime) const Icon(Icons.punch_clock_sharp)
      ],
    );
  }
}
