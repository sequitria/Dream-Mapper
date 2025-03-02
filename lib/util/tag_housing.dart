import 'package:flutter/material.dart';

class TagHousing extends StatefulWidget {
  final String tagHouseName;
  const TagHousing({super.key, required this.tagHouseName});

  @override
  State<TagHousing> createState() => _TagHousingState();
}

class _TagHousingState extends State<TagHousing> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.tagHouseName,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
