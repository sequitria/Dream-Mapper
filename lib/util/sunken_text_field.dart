
import 'package:flutter/material.dart';

class SunkenTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final int minLines;
  final int? maxLines;
  final Color backgroundColor;
  final Color textColor;

  const SunkenTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.minLines = 1,
    this.maxLines,
    this.backgroundColor = const Color(0xFF121212),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        // Use a very subtle shadow inside with an overlay
        decoration: BoxDecoration(
          color: backgroundColor,
          // Subtle inner shadow using overlay instead of actual shadows
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [
              backgroundColor.withValues(alpha: 0.85),
              backgroundColor,
            ],
            stops: const [0.1, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // This creates the dark inner shadow on top and left
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 2,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.6),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Dark shadow on left
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              width: 2,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.black.withValues(alpha: 0.6),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Light inner shadow on bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 2,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color.fromARGB(255, 255, 255, 255)
                          .withValues(alpha: 0.06),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Light inner shadow on right
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              width: 2,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Color.fromARGB(255, 255, 255, 255)
                          .withValues(alpha: 0.06),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Actual text field with padding
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: TextField(
                controller: controller,
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  labelText: labelText,
                  labelStyle: TextStyle(
                    color: textColor.withValues(alpha: 0.8),
                    fontSize: 16,
                  ),
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: textColor.withValues(alpha: 0.4),
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 4),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                minLines: minLines,
                maxLines: maxLines,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
