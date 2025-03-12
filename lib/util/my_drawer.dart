import 'package:dream_mapper/pages/dreams_page.dart';
import 'package:dream_mapper/pages/home_page.dart';
import 'package:dream_mapper/pages/insights_page.dart';
import 'package:dream_mapper/pages/tags_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            DrawerHeader(
                child: Center(
                    child: Text(
              "[ INSERT LOGO ]",
              style: TextStyle(fontSize: 20),
            ))),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.cloud),
              title: Text("Dreams"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DreamsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.tag),
              title: Text("Tags"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => TagsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.data_thresholding_sharp),
              title: Text("Insights"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => InsightsPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
