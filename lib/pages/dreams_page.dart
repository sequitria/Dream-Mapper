import 'package:dream_mapper/util/my_drawer.dart';
import 'package:flutter/material.dart';

class DreamsPage extends StatefulWidget {
  const DreamsPage({super.key});

  @override
  State<DreamsPage> createState() => _DreamsPageState();
}

class _DreamsPageState extends State<DreamsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Center(
        child: Text("DreamPage"),
      ),
    );
  }
}