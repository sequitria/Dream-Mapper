import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.black,
      thickness: 1,
      indent: 10,
      endIndent: 10,
    );
  }
}
