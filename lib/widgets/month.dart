import 'package:dream_mapper/services/calendar_services.dart';
import 'package:flutter/material.dart';

class Month extends StatefulWidget {
  final String monthId;
  final String monthName;
  final int numDays;
  final List<int> firstAndLastWeekday;

  const Month(
      {super.key,
      required this.monthId,
      required this.monthName,
      required this.numDays,
      required this.firstAndLastWeekday});

  @override
  State<Month> createState() => _MonthState();
}

class _MonthState extends State<Month> {
  late CalendarServices calendarService = CalendarServices();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (String day in calendarService.getWeekDays())
                Text(day),
            ],
          )
        ],
      ),
    );
  }
}
