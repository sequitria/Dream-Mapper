import 'package:dream_mapper/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DreamMapper());
}

class DreamMapper extends StatelessWidget {
  const DreamMapper({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
    );
  }
}
