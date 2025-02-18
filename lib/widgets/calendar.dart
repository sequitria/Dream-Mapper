import 'package:dream_mapper/services/calendar_services.dart';
import 'package:dream_mapper/widgets/month.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    super.key,
  });

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late DateTime currentState;
  late CalendarServices calendarService;

  @override
  void initState() {
    super.initState();
    currentState = DateTime.now();
    calendarService = CalendarServices();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 75.0),
      //color: Colors.blueGrey,
      alignment: Alignment.topCenter,
      child: Month(monthId: calendarService.getMonthId(currentState),
          monthName: calendarService.getMonthName(calendarService.getMonth(currentState)),
          numDays: calendarService.getMonthDays(currentState),
          firstAndLastWeekday: calendarService.getFirstAndLastWeekDay(currentState)),
    );
  }
}
