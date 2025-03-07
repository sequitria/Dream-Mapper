import 'package:dream_mapper/services/journal_editing_controller.dart';
import 'package:flutter/material.dart';

class DreamTagContainment extends StatefulWidget {
  const DreamTagContainment({super.key});

  @override
  State<DreamTagContainment> createState() => _DreamTagContainmentState();
}

class _DreamTagContainmentState extends State<DreamTagContainment> {
  late JournalEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: GridView(
            scrollDirection: Axis.horizontal,
            physics: const PageScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              crossAxisCount: 2,
            ),
            children: [],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.25,
          child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context, builder: (context) => Container());
              },
              icon: Icon(Icons.add)),
        )
      ],
    );
  }
}
