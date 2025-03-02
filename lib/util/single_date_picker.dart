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

    final theme = Theme.of(context);

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
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 15, 14, 14),
                //border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(140, 35, 35, 35),
                      offset: Offset(-4, -4),
                      blurRadius: 5,
                      //spreadRadius: 2
                    ),
                    BoxShadow(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      offset: Offset(4, 4),
                      blurRadius: 5,
                      spreadRadius: 1
                    ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${date.day}/${date.month}/${date.year}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface
                    ),
                  ),
                  Icon(Icons.calendar_today, color: theme.colorScheme.primary),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
