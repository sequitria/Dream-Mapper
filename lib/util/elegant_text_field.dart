import 'dart:ui';
import 'package:flutter/material.dart';

class ElegantTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;
  final String hintText;
  final IconData icon;
  final Color iconColor;
  final Color glowColor;
  final int minLines;
  final int? maxLines;
  final Color backgroundColor;
  final Color textColor;
  final Color hintColor;

  const ElegantTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.labelText,
    required this.hintText,
    required this.icon,
    this.iconColor = Colors.white,
    this.glowColor = Colors.purple,
    this.minLines = 1,
    this.maxLines,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.hintColor = const Color(0xFF555555),
  });

  @override
  State<ElegantTextField> createState() => _ElegantTextFieldState();
}

class _ElegantTextFieldState extends State<ElegantTextField> with SingleTickerProviderStateMixin {
  late ValueNotifier<bool> _focusNotifier;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _focusNotifier = ValueNotifier<bool>(widget.focusNode.hasFocus);
    
    // Listen to focus changes
    widget.focusNode.addListener(_onFocusChange);
    
    // Setup animation for subtle pulse effect on label and icon
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    
    _pulseAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(
        parent: _pulseController,
        curve: Curves.easeInOut,
      ),
    );
    
    _pulseController.repeat(reverse: true);
  }

  void _onFocusChange() {
    _focusNotifier.value = widget.focusNode.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _focusNotifier,
      builder: (context, isFocused, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Label with icon - with pulse animation when focused
            AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                final double opacity = isFocused 
                    ? 0.7 + (_pulseAnimation.value * 0.3) 
                    : 0.7;
                
                final double iconOpacity = isFocused 
                    ? 0.7 + (_pulseAnimation.value * 0.3) 
                    : 0.7;
                
                return Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isFocused 
                              ? widget.iconColor.withValues(alpha: iconOpacity) 
                              : Colors.white24,
                          width: 1,
                        ),
                        boxShadow: [
                          if (isFocused)
                            BoxShadow(
                              color: widget.glowColor.withValues(alpha: 0.2 * _pulseAnimation.value),
                              blurRadius: 12,
                              spreadRadius: 0,
                            ),
                        ],
                      ),
                      child: Icon(
                        widget.icon,
                        color: isFocused 
                            ? widget.iconColor.withValues(alpha: iconOpacity) 
                            : Colors.white70,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      widget.labelText.toUpperCase(),
                      style: TextStyle(
                        color: isFocused 
                            ? widget.iconColor.withValues(alpha: opacity) 
                            : Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
            
            // Borderless text field - clean and minimal
            Stack(
              children: [
                // Text field input - completely clean
                TextField(
                  controller: widget.controller,
                  focusNode: widget.focusNode,
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: 18,
                    height: 1.6,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      color: widget.hintColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: false,
                  ),
                  minLines: widget.minLines,
                  maxLines: widget.maxLines,
                  cursorColor: widget.glowColor,
                  cursorWidth: 1.5,
                  cursorRadius: const Radius.circular(1),
                  textAlignVertical: TextAlignVertical.top,
                ),
                
                // Bottom line indicator that shows only when focused
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 1,
                    color: isFocused ? widget.glowColor.withValues(alpha: 0.4) : Colors.transparent,
                  ),
                ),
              ],
            ),
            
            // Add some spacing after the text field
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChange);
    _focusNotifier.dispose();
    _pulseController.dispose();
    super.dispose();
  }
}