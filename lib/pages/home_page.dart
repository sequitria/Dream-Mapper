import 'package:dream_mapper/pages/journal_detail_page.dart';
import 'package:dream_mapper/services/journal_display_data_controller.dart';
import 'package:dream_mapper/services/journal_services.dart';
import 'package:dream_mapper/util/my_drawer.dart';
import 'package:dream_mapper/widgets/calendar.dart';
import 'package:dream_mapper/widgets/journal_scroll.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

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
      drawer: MyDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Builder(builder: (context) {
              return Expanded(
                  flex: 5,
                  child: Calendar(openDrawer: () {
                    Scaffold.of(context).openDrawer();
                  }));
            }),
            Expanded(flex: 3, child: JournalScroll(controller: _controller)),
            Expanded(
              flex: 1,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: FloatingActionButton.extended(
                      heroTag: 'create_journal_button',
                      icon: const Icon(LineIcons.feather),
                      label: const Text('NEW JOURNAL'),
                      onPressed: () {
                        Navigator.of(context).push(_createRoute());
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Creates the route for journal detail page
Route _createRoute() {
  return PageRouteBuilder(
    opaque: false,
    pageBuilder: (context, animation, secondaryAnimation) =>
        JournalDetailPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
