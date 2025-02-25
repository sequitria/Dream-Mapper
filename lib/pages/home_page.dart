import 'package:dream_mapper/util/floating_buttons.dart';
import 'package:dream_mapper/util/nav_bar.dart';
import 'package:dream_mapper/widgets/calendar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Calendar(),
        
      floatingActionButton: FloatingButtons(),
      bottomNavigationBar: SafeArea(
        child: NavBar()
      ),
    );
  }
}