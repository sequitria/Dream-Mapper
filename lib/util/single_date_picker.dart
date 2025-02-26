import 'package:flutter/material.dart';
 import 'package:shadcn_ui/shadcn_ui.dart';

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
            child: ShadDatePicker(
              selected: date,
              onChanged: (newDate) {
                if (newDate != null) {
                  onDateChanged(newDate);
                }
              },
            ),
          );
        });
  }
}
