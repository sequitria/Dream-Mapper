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
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        margin: EdgeInsets.all(40),
        child: Center(child: Text("HomePage"))
        ),
    );
  }
}