import 'package:flutter/material.dart';

class Date extends StatelessWidget {
  Date({super.key});

  late DateTime dateId;
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
    return const Placeholder();
  }
}
