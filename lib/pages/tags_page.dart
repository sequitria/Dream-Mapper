import 'package:dream_mapper/util/my_drawer.dart';
import 'package:dream_mapper/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

class TagsPage extends StatefulWidget {
  const TagsPage({super.key});

  @override
  State<TagsPage> createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Center(
        child: Text("TagsPage"),
      ),
      bottomNavigationBar: SafeArea(child: NavBar()),
    );
  }
}