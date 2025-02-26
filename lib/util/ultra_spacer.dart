import 'package:dream_mapper/util/horizontal_divider.dart';
import 'package:flutter/material.dart';

class UltraSpacer extends StatelessWidget {
  const UltraSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 20,
        ),
        HorizontalDivider(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}