import 'package:dream_mapper/services/journal_services.dart';
import 'package:flutter/material.dart';

class JournalScroll extends StatefulWidget {
  const JournalScroll({super.key});

  @override
  State<JournalScroll> createState() => _JournalScrollState();
}

class _JournalScrollState extends State<JournalScroll> {

  final JournalServices _journalService = JournalServices();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
