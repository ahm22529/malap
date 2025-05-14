import 'package:flutter/material.dart';
import 'package:malab/fetures/home/presention/view/widget/booking_card.dart';

import 'package:malab/fetures/home/presention/view/widget/card_turns.dart';
import 'package:malab/fetures/home/presention/view/widget/show_more_widget.dart';
import 'package:malab/fetures/home/presention/view/widget/user_ifo_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 26,
            ),
            const UserInfo(),
            SizedBox(
              height: 20,
            ),
            ShowMore(
              titel: 'الدورات',
              onTap: () {},
            ),
            SizedBox(
              height: 20,
            ),
            CardTruns(
              color: const Color(0xffFF4B00),
            ),
            SizedBox(
              height: 20,
            ),
            ShowMore(
              titel: 'حجوزات اليوم',
              onTap: () {},
            ),
            SizedBox(
              height: 20,
            ),
            BookingCard()
          ],
        ),
      ),
    );
  }
}
