import 'package:flutter/material.dart';
import 'package:simply_private/chat/chat_page.dart';

class ChatPreview extends StatelessWidget {
  final IconData icon;
  final int userId;
  final String name;
  final String messageText;
  final int messageTime;
  final bool messageRead;

  const ChatPreview({
    super.key,
    required this.icon,
    required this.userId,
    required this.name,
    required this.messageText,
    required this.messageTime,
    required this.messageRead,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => ChatPage(userId: userId)));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Icon(icon),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Text(messageText),
            ],
          ),
        ],
      ),
    );
  }
}
