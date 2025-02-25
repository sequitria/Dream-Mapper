import 'package:dream_mapper/services/calendar_services.dart';
import 'package:flutter/material.dart';

class Month extends StatelessWidget {
  final DateTime displayMonth;
  const Month({
    super.key,
    required this.displayMonth,
  });

  @override
  Widget build(BuildContext context) {
    final calendarService = CalendarServices();
    final days = calendarService.getMonthGrid(displayMonth);

    return Column(
      children: [
        // Calendar grid
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: days.length,
            itemBuilder: (context, index) {
              final day = days[index];
              final isCurrentMonth = day.month == displayMonth.month;

              return Container(
                decoration: BoxDecoration(
                  color: isCurrentMonth ? Colors.white : Colors.grey[200],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    day.day.toString(),
                    style: TextStyle(
                      color: isCurrentMonth ? Colors.black : Colors.grey,
                      fontWeight:
                          isCurrentMonth ? FontWeight.w500 : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
