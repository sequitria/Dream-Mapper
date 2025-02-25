import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const GNav(tabs: [
      GButton(
        icon: LineIcons.tags,
        text: 'Tags',
      ),
      GButton(
        icon: LineIcons.cloudversify,
        text: 'Journals',
      ),
      GButton(
        icon: LineIcons.infinity,
        text: 'Data',
      )
    ]);
  }
}