class CalendarServices {

  final _date = DateTime.now();
  final List<String> daysOfWeek = [
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat"
  ];

  // Get number of days in a month
  int getMonthDays() {
    return DateTime(_date.year, _date.month+1, 0).day;
  }

  List<String> getDaysOfWeek() {
    return daysOfWeek;
  }
}

void main() {
  //CalendarServices calendarTest = CalendarServices();
  //print(calendarTest.getMonthDays());
}
