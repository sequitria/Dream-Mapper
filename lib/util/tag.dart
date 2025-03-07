import 'package:flutter/material.dart';

class Tag extends StatelessWidget {

  final String tagName;
  const Tag({
    super.key,
    required this.tagName
    });

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment(0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[900]
      ),
      child: Text("#$tagName"),
    );
  }
}
