class CalendarServices {
  // for the title of the month
  String getMonthName(int monthNum) {
    if (monthNum > 0 && monthNum <= 12) {
      switch (monthNum) {
        case 1:
          return "Jan";
        case 2:
          return "Feb";
        case 3:
          return "Mar";
        case 4:
          return "Apr";
        case 5:
          return "May";
        case 6:
          return "Jun";
        case 7:
          return "Jul";
        case 8:
          return "Aug";
        case 9:
          return "Sep";
        case 10:
          return "Oct";
        case 11:
          return "Nov";
        case 12:
          return "Dec";
      }
    }
    throw "Error: wrong month number entered";
  }

  // Simple method to get all weekdays as strings
  List<String> getWeekDays() {
    return ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  }

  // Get month as an integer from 1-12
  int getMonth(DateTime date) {
    return DateTime(date.year, date.month).month;
  }

  // monthId is the year concantenated with the month
  String getMonthId(DateTime date) {
    int year = DateTime(date.year, date.month).year;
    int month = DateTime(date.year, date.month).month;
    return (year.toString() + month.toString());
  }

  // Get number of days in a month
  int getMonthDays(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }

  // Get the weekday as an int of the first and last day of the month
  List<int> getFirstAndLastWeekDay(DateTime date) {
    List<int> firstAndLastDay = [];
    firstAndLastDay.add(DateTime(date.year, date.month, 1).weekday);
    firstAndLastDay.add(DateTime(date.year, date.month + 1, 0).weekday);
    return firstAndLastDay;
  }
}

void main() {
  // DateTime now = DateTime.now();
  // CalendarServices calendarTest = CalendarServices();
  // print(calendarTest.getMonth(now));
}
