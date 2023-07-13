import 'package:flutter/material.dart';
import 'package:simply_private/main.dart';
import 'package:simply_private/types/MessageData.dart';
import 'package:simply_private/types/UserData.dart';

class ChatPage extends StatefulWidget {
  final int userId;

  const ChatPage({super.key, required this.userId});

  @override
  State<ChatPage> createState() => _ChatPageState(userId: userId);
}

class _ChatPageState extends State<ChatPage> {
  // Future<int> userId = Future<int>.delayed(const Duration(seconds: 2), () => 0);
  final int userId;

  final Future<UserData> userData;
  final Future<List<MessageData>> messages;
  // Future<List<MessageData>> messages = dataProvider.getMessagesByUser(userId);

  _ChatPageState({required this.userId})
      : messages = dataProvider.getMessagesByUserId(userId),
        userData = dataProvider.getUserByUserId(userId);

  void onSubmitMessage(String message) {}

  void onSubmitMessageButton() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: userData,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Text(snapshot.data?.name ?? 'user_data_error')
                : const CircularProgressIndicator();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: messages,
              builder: (_, snapshot) => ListView.builder(
                reverse: true,
                itemCount: snapshot.data?.length,
                itemBuilder: (_, i) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data?[i].message ?? '',
                      textScaleFactor: 2,
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
          TextField(
            onSubmitted: onSubmitMessage,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.end,
      ),
    );
  }
}
