import 'package:chatapp_frontend/pages/chatroom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Chatslistentry extends StatelessWidget {
  final String identifier;
  final String name;

  const Chatslistentry(
      {super.key, required this.identifier, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100],
          border: const Border(
              bottom: BorderSide(
            color: Colors.black,
            width: 1,
          ))),
      child: GestureDetector(
        onTap: () => _onTap(context),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
              width: 75,
              height: 75,
              child: const Icon(
                Icons.group,
                size: 50,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              height: 100,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    // this should then push the fitting chatroom page with navigator probably or not?
    print("onTap called, identifier is $identifier");
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChatPage(
                roomIdentifier: identifier,
              )),
    );
  }
}
