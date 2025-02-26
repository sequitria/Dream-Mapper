import 'package:dream_mapper/pages/create_journal_page.dart';
import 'package:dream_mapper/services/journal_services.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';


/*
- A new journal instance is created when this method is called
- The new journal instance has a date of Datetime.now(). Which can be changed
  by the user later

- This journal that has just been created is accessed via the getNewestJournal()
  function

*/
Route _createRoute() {
  return PageRouteBuilder(
    opaque: false,
    pageBuilder: (context, animation, secondaryAnimation) =>
        CreateJournalPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

class FloatingButtons extends StatelessWidget {
  
  FloatingButtons({super.key});
  final JournalServices _journalService = JournalServices();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // SEARCH THROUGH JOURNALS
        FloatingActionButton.small(
          heroTag: 'search_button',
          child: const Icon(LineIcons.searchengin),
          onPressed: () {},
        ),

        const SizedBox(
          height: 15,
        ),

        // CREATE A JOURNAL
        FloatingActionButton.small(
          heroTag: 'create_journal_button',
          child: const Icon(LineIcons.feather),
          onPressed: () {
            // Just navigate to the page, let the page create the journal
            Navigator.of(context).push(_createRoute());
          },
        )
      ],
    );
  }
}
