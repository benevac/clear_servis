import 'package:flutter/material.dart';

class CalendarWidget extends StatelessWidget {
  final List<String> availableDates;

  CalendarWidget({required this.availableDates});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: availableDates.map((date) => Text(date)).toList(),
    );
  }
}
