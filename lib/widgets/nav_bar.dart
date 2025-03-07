import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class NavBar extends StatefulWidget {
  final int initialIndex;
  final Function(int)? onTabChange;

  const NavBar({
    super.key,
    this.initialIndex = 0, // Default to Home tab
    this.onTabChange,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late int _selectedIndex;

  // Color palette
  final List<Color> _tabColors = [
    const Color(0xFFC4A287),
    const Color(0xFF9E7BB5),
    const Color(0xFF7294AF),
    const Color(0xFF3AA39F),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: GNav(
        rippleColor: Colors.grey[800]!.withValues(alpha: 0.2),
        hoverColor: Colors.grey[700]!.withValues(alpha: 0.1),
        haptic: true,
        gap: 8,
        activeColor: Colors.white,
        iconSize: 22,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        duration: const Duration(milliseconds: 300),
        tabBackgroundColor: _tabColors[_selectedIndex],
        tabBorderRadius: 20,
        curve: Curves.fastOutSlowIn,
        backgroundColor: Colors.transparent,
        color: Colors.grey[600],
        // Add the glow effect with tabShadow
        tabShadow: [
          BoxShadow(
            color: _tabColors[_selectedIndex].withValues(alpha: 0.1),
            blurRadius: 12,
            spreadRadius: 1,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        tabs: [
          // Home tab
          _buildTab(0, LineIcons.home, 'Home'),
          // Dreams tab
          _buildTab(1, LineIcons.cloudversify, 'Dreams'),
          // Tags tab
          _buildTab(2, LineIcons.tags, 'Tags'),
          // Insights tab
          _buildTab(3, LineIcons.infinity, 'Insights'),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
          HapticFeedback.lightImpact();
          if (widget.onTabChange != null) {
            widget.onTabChange!(index);
          }
        },
      ),
    );
  }

  GButton _buildTab(int index, IconData icon, String text) {
    bool isSelected = _selectedIndex == index;
    Color iconColor =
        isSelected ? Colors.white : _tabColors[index].withValues(alpha: 0.8);
    Color textColor = isSelected ? Colors.white : _tabColors[index];

    return GButton(
      icon: icon,
      text: text,
      iconColor: iconColor,
      iconActiveColor: Colors.white,
      textColor: textColor,
    );
  }
}
