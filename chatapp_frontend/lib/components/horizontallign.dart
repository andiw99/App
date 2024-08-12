import 'package:flutter/material.dart';

class HorizontalLineWithLabel extends StatelessWidget {
  final String label;

  const HorizontalLineWithLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Divider(
            thickness: 1,  // Adjust the thickness of the line
            color: Colors.black,  // Adjust the color of the line
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            label,
            style: const TextStyle(fontSize: 16),  // Adjust the text style
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,  // Adjust the thickness of the line
            color: Colors.black,  // Adjust the color of the line
          ),
        ),
      ],
    );
  }
}