import 'dart:ui';
import 'package:flutter/material.dart';

class GlowingDatePicker extends StatelessWidget {
  final ValueNotifier<DateTime> dateNotifier;
  final Function(DateTime) onDateChanged;
  final Color glowColor;
  final Color textColor;
  final Color labelColor;
  final Color iconColor;
  final Color backgroundColor;
  
  const GlowingDatePicker({
    super.key,
    required this.dateNotifier,
    required this.onDateChanged,
    this.glowColor = const Color(0xFFB24BF3),
    this.textColor = Colors.white,
    this.labelColor = Colors.grey,
    this.iconColor = const Color(0xFFB24BF3),
    this.backgroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime>(
      valueListenable: dateNotifier,
      builder: (context, date, child) {
        return GestureDetector(
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2020),
              lastDate: DateTime.now(),
              builder: (context, child) {
                return Theme(
                  data: ThemeData.dark().copyWith(
                    colorScheme: ColorScheme.dark(
                      primary: glowColor,
                      onPrimary: textColor,
                      surface: Color(0xFF1A1A1A),
                      onSurface: textColor,
                    ),
                    dialogBackgroundColor: Color(0xFF121212),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: child!,
                  ),
                );
              },
            );

            if (pickedDate != null) {
              onDateChanged(pickedDate);
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.12),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: glowColor.withValues(alpha: 0.2),
                      blurRadius: 20,
                      spreadRadius: -5,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "DREAM DATE",
                          style: TextStyle(
                            color: labelColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _getFormattedDate(date),
                          style: TextStyle(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.03),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.1),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: glowColor.withValues(alpha: 0.15),
                            blurRadius: 15,
                            spreadRadius: -5,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.calendar_month_rounded,
                        color: iconColor,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  
  String _getFormattedDate(DateTime date) {
    final months = [
      "January", "February", "March", "April", "May", "June", 
      "July", "August", "September", "October", "November", "December"
    ];
    return "${date.day} ${months[date.month - 1]} ${date.year}";
  }
}