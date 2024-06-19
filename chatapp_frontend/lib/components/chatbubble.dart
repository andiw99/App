import 'package:flutter/material.dart';


class Chatbubble extends StatelessWidget {
  const Chatbubble({super.key, this.author, this.msg, this.color});

  final String? author;
  final String? msg;
  final Color? color;

  @override
  Widget build(BuildContext context) {
      if (author == "flutter") {
    const col = Color.fromARGB(255, 133, 206, 110);
    return _buildOwnChatBubble(context, author, msg, col);
  } else {
    const col = Color.fromARGB(255, 94, 182, 255);
    return _buildChatMateBubble(context, author, msg, col);
  }
  }


  // TODO duplicate Code but not worth fixing rn
  Widget _buildChatMateBubble(
    BuildContext context, String? author, String? msg, Color color) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      margin: const EdgeInsets.symmetric(vertical: 7.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Text.rich(
        TextSpan(children: <TextSpan>[
          TextSpan(
              text: '$author\n',
              style: const TextStyle(fontSize: 15, color: Colors.white)),
          TextSpan(text: msg, style: const TextStyle(fontSize: 15))
        ]),
      ),
    ),
  );
}

Widget _buildOwnChatBubble(
    BuildContext context, String? author, String? msg, Color color) {
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      margin: const EdgeInsets.symmetric(vertical: 7.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Text.rich(
        TextSpan(children: <TextSpan>[
          TextSpan(
              text: '$author\n',
              style: const TextStyle(fontSize: 15, color: Colors.white)),
          TextSpan(text: msg, style: const TextStyle(fontSize: 15))
        ]),
      ),
    ),
  );
}
}