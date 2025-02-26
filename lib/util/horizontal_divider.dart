import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadDivider.horizontal(
      color: Colors.black,
      thickness: 1,
      margin: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
