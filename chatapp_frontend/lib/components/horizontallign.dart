import 'package:flutter/material.dart';

class HorizontalLineWithLabel extends StatelessWidget {
  final String label;

  const HorizontalLineWithLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
           Expanded(
            child: Divider(
              thickness: 1,  // Adjust the thickness of the line
              color: Colors.grey[500]  // Adjust the color of the line
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              label,
              style: const TextStyle(fontSize: 16),  // Adjust the text style
            ),
          ),
           Expanded(
            child: Divider(
              thickness: 1,  // Adjust the thickness of the line
              color: Colors.grey[500],  // Adjust the color of the line
            ),
          ),
        ],
      ),
    );
  }
}