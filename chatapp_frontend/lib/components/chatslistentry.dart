import 'package:flutter/material.dart';

class Chatslistentry extends StatelessWidget {
  final String identifier;
  final String name;

  const Chatslistentry({super.key, required this.identifier, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 1,
          )
        ),
        child: Center(          
          child: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    // this should then push the fitting chatroom page
  }
}