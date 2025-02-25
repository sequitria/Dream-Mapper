import 'package:dream_mapper/services/journal_services.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class FloatingButtons extends StatelessWidget {
  final JournalServices journalService = JournalServices();
  FloatingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton.small(
          child: Icon(LineIcons.searchengin),
          onPressed: () {},
        ),

        SizedBox(
          height: 15,
        ),

        // CREATE A JOURNAL
        FloatingActionButton.small(
          child: Icon(LineIcons.feather),
          onPressed: () {},
        )
      ],
    );
  }
}
