import 'package:dream_mapper/util/floating_buttons.dart';
import 'package:dream_mapper/util/nav_bar.dart';
import 'package:dream_mapper/widgets/calendar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(221, 26, 2, 2),
      body: Column(
        children: [
          Expanded(child: Calendar()),
        ],
      ),
      // Make a journal viewer
        
      floatingActionButton: FloatingButtons(),
      bottomNavigationBar: SafeArea(
        child: NavBar()
      ),
    );
  }
}