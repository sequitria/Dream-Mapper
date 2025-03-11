import 'dart:ui';
import 'package:flutter/material.dart';

class GlowingFAB extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData icon;
  final Color glowColor;
  final Color backgroundColor;
  final Color textColor;
  
  const GlowingFAB({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon = Icons.check,
    this.glowColor = const Color(0xFFB24BF3),
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: glowColor.withValues(alpha: 0.35),
            blurRadius: 20,
            spreadRadius: -4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: FloatingActionButton.extended(
            onPressed: onPressed,
            backgroundColor: Colors.white.withValues(alpha: 0.07),
            foregroundColor: textColor,
            elevation: 0,
            extendedPadding: const EdgeInsets.symmetric(horizontal: 22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(
                color: glowColor.withValues(alpha: 0.4),
                width: 1,
              ),
            ),
            label: Text(
              label.toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: glowColor.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 20),
            ),
            extendedIconLabelSpacing: 12,
          ),
        ),
      ),
    );
  }
}