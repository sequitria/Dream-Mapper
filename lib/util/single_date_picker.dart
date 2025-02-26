import 'package:flutter/material.dart';
 import 'package:shadcn_ui/shadcn_ui.dart';

class SingleDatePicker extends StatelessWidget {
  const SingleDatePicker({super.key});


  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: const ShadDatePicker(

      ),
    );
  }
}
