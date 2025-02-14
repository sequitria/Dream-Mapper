import 'package:flutter/material.dart';

class Date extends StatefulWidget {

  final DateTime dateId;

  const Date({
    super.key,
    required this.dateId
  });
  @override
  State<Date> createState() => _DateState();
}


class _DateState extends State<Date> {
  late List<String> dreamList = [];
  // Add dream
  void addDream(String dream) {
    dreamList.add(dream);
  }

  // Remove dream
  void removeDream(String dream) {
    dreamList.remove(dream);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.dateId.year}/${widget.dateId.month}/${widget.dateId.day}" ),
      ),
    );
  }
}
