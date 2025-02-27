import 'package:flutter/material.dart';

class SingleDatePicker extends StatelessWidget {
  final ValueNotifier<DateTime> dateNotifier;
  final Function(DateTime) onDateChanged;

  const SingleDatePicker({
    super.key,
    required this.dateNotifier,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime>(
      valueListenable: dateNotifier,
      builder: (context, date, child) {
        return ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: GestureDetector(
            onTap: () async {
              // Show the date picker dialog when tapped
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(2020), // You can adjust this as needed
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: Colors.blue, // Changes the header color
                        onPrimary: Colors.white, // Text color on primary
                        onSurface: Colors.black, // Regular text color
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue, // Button text color
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
              );

              if (pickedDate != null) {
                onDateChanged(pickedDate);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${date.day}/${date.month}/${date.year}",
                    style: TextStyle(fontSize: 16),
                  ),
                  Icon(Icons.calendar_today, color: Colors.grey.shade600),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
