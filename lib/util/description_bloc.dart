import 'package:flutter/material.dart';

class DescriptionBloc extends StatelessWidget {
  final String labelTitle;
  const DescriptionBloc({
    super.key,
    required this.labelTitle
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        minLines: 5,
        maxLines: null,
      
        style: TextStyle(
          color: Colors.white, // Dark gray text for better readability
          //fontSize: 30.0,
        ),
      
        decoration: InputDecoration(
          hintText: 'Describe your dream experience...',
          hintStyle: TextStyle(color: Colors.grey[500]),
          labelText: labelTitle,
          labelStyle: TextStyle(color: Colors.white),
          floatingLabelBehavior: FloatingLabelBehavior.always,

      
          // Unfocused border
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black, 
              width: 4
            ),
          ),
      
          // Focused border
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black, width: 3),
          ),
        ),
      
        onChanged: (value) {
        },
      
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a description';
          }
          return null;
        },
    );
  }
}
