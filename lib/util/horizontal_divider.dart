import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Divider(
      color: theme.colorScheme.primary,
      thickness: 1,
      indent: 10,
      endIndent: 10,
    );
  }
}
