import 'package:flutter/material.dart';
import 'package:malab/fetures/booking/presention/view/widget/day_info.dart';

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // الساعات المحجوزة (مثال فقط)
    final bookedHours = [10, 13, 18]; // يعني الساعة 10 ص، 1 ظهرًا، و6 مساءً

    return Scaffold(
      appBar: AppBar(title: Text("حجز الملعب")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DayInfo(),
            SizedBox(height: 20),
            HourSlotList(bookedHours: bookedHours),
          ],
        ),
      ),
    );
  }
}

List<List<int>> getAvailableIntervals(List<int> bookedHours) {
  final List<List<int>> availableIntervals = [];
  final sortedBooked = [...bookedHours]..sort();

  int start = 0;
  for (int booked in sortedBooked) {
    if (start < booked) {
      availableIntervals.add([start, booked]);
    }
    start = booked + 1;
  }

  // تحقق من نهاية اليوم (مثلاً الساعة 23)
  if (start < 24) {
    availableIntervals.add([start, 24]);
  }

  return availableIntervals;
}

class HourSlotList extends StatelessWidget {
  final List<int> bookedHours;

  HourSlotList({required this.bookedHours});

  @override
  Widget build(BuildContext context) {
    final availableIntervals = getAvailableIntervals(bookedHours);

    return Expanded(
      child: ListView.builder(
        itemCount: availableIntervals.length,
        itemBuilder: (context, index) {
          final interval = availableIntervals[index];
          final startHour = interval[0];
          final endHour = interval[1];

          final startTime =
              TimeOfDay(hour: startHour, minute: 0).format(context);
          final endTime = TimeOfDay(hour: endHour, minute: 0).format(context);

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.access_time, color: Colors.green),
                SizedBox(width: 10),
                Text(
                  "من $startTime إلى $endTime",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
