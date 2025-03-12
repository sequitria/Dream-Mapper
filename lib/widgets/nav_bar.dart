import 'package:dream_mapper/pages/create_journal_page.dart';
import 'package:dream_mapper/pages/dreams_page.dart';
import 'package:dream_mapper/pages/home_page.dart';
import 'package:dream_mapper/pages/insights_page.dart';
import 'package:dream_mapper/pages/tags_page.dart';
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

  // Color palette (added a color for the Add button)
  final List<Color> _tabColors = [
    const Color(0xFFC4A287),  // Home
    const Color(0xFF9E7BB5),  // Dreams
    const Color(0xFF4CAF50),  // Add (Green color)
    const Color(0xFF7294AF),  // Tags
    const Color(0xFF3AA39F),  // Insights
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  // Create route for the journal creation page
  Route _createJournalRoute() {
    return PageRouteBuilder(
      opaque: false,
      pageBuilder: (context, animation, secondaryAnimation) => const CreateJournalPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
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
          
          // Add button (centered, special)
          _buildAddButton(),
          
          // Tags tab
          _buildTab(3, LineIcons.tags, 'Tags'),
          
          // Insights tab
          _buildTab(4, LineIcons.infinity, 'Insights'),
        ],
        selectedIndex: _selectedIndex == 2 ? 0 : _selectedIndex, // Don't select Add button
        onTabChange: (index) {
          HapticFeedback.lightImpact();
          
          // Handle Add button separately
          if (index == 2) {
            Navigator.of(context).push(_createJournalRoute());
            return; // Don't update selectedIndex for Add button
          }
          
          setState(() {
            _selectedIndex = index;
          });
          
          // Handle navigation for tabs
          _handleNavigation(context, index);
          
          // Call onTabChange callback if provided
          if (widget.onTabChange != null) {
            widget.onTabChange!(index);
          }
        },
      ),
    );
  }

  void _handleNavigation(BuildContext context, int index) {
    switch (index) {
      case 0: // Home
        // Navigate to HomePage and clear the stack
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false,
        );
        break;
      // Add other tab navigation handlers as needed
      // case 1: // Dreams tab
      case 1: // Home
        // Navigate to HomePage and clear the stack
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const DreamsPage()),
          (route) => false,
        );
        break;
      // case 3: // Tags tab
      case 3: // Home
        // Navigate to HomePage and clear the stack
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const TagsPage()),
          (route) => false,
        );
        break;
      // case 4: // Insights tab
      case 4: // Home
        // Navigate to HomePage and clear the stack
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const InsightsPage()),
          (route) => false,
        );
        break;
    }
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

  // Special Add button with different styling
  GButton _buildAddButton() {
    return GButton(
      icon: Icons.add_circle,
      text: 'Add',
      iconColor: _tabColors[2],
      iconActiveColor: Colors.white,
      textColor: _tabColors[2],
      iconSize: 30, // Larger icon
    );
  }
}