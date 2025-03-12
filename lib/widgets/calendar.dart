import 'package:dream_mapper/services/calendar_services.dart';
import 'package:dream_mapper/widgets/month.dart';
import 'package:flutter/material.dart';

// lib/widgets/calendar.dart
class Calendar extends StatefulWidget {
  final VoidCallback openDrawer;
  const Calendar({
    super.key,
    required this.openDrawer
  });

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late PageController _pageController;
  late DateTime _currentMonth;
  final CalendarServices _calendarService = CalendarServices();

  @override
  void initState() {
    super.initState();
    // Start at a large number to allow scrolling backwards
    _currentMonth = DateTime.now();
    _pageController = PageController(
      initialPage: 2000, // Start at 1000 to allow scrolling both ways
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      // Calculate month offset from initial page
      int monthOffset = page - 2000;
      _currentMonth = DateTime(
        DateTime.now().year,
        DateTime.now().month + monthOffset,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${_calendarService.getMonthName(_currentMonth.month)} ${_currentMonth.year}',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: GestureDetector(
          onTap: widget.openDrawer,
          child: Icon(Icons.menu),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SafeArea(
          child: Column(
            children: [
              // ROW OF WEEKDAYS
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _calendarService
                      .getWeekDays()
                      .map(
                        (day) => SizedBox(
                          width: 40,
                          child: Text(
                            day,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              //color: Color.fromARGB(255, 96, 63, 63),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              // Calendar pages
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemBuilder: (context, index) {
                    // Calculate the month for this page
                    final monthOffset = index - 2000;
                    final month = DateTime(
                      DateTime.now().year,
                      DateTime.now().month + monthOffset,
                    );

                    return Month(
                      displayMonth: month,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
