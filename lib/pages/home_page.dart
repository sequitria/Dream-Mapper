import 'package:dream_mapper/services/journal_display_data_controller.dart';
import 'package:dream_mapper/services/journal_services.dart';
import 'package:dream_mapper/util/floating_buttons.dart';
import 'package:dream_mapper/widgets/nav_bar.dart';
import 'package:dream_mapper/widgets/calendar.dart';
import 'package:dream_mapper/widgets/journal_scroll.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final JournalDisplayDataController _controller =
      JournalDisplayDataController(JournalServices());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(221, 26, 2, 2),
      body: Column(
        children: [
          Expanded(flex: 5, child: Calendar()),
          Expanded(
            flex: 3,
            child: JournalScroll(controller: _controller)
          ),
    
          // SizedBox(
          //   height: 100,
          // )
        ],
      ),
      // Make a journal viewer

      floatingActionButton: FloatingButtons(),
      bottomNavigationBar: SafeArea(child: NavBar(),
      ),
    );
  }
}
