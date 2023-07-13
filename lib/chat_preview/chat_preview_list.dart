import 'package:flutter/material.dart';
import 'package:simply_private/chat_preview/chat_preview.dart';
import 'package:simply_private/main.dart';
import 'package:simply_private/types/ChatPreviewData.dart';

class ChatPreviewList extends StatefulWidget {
  const ChatPreviewList({super.key});

  @override
  State<ChatPreviewList> createState() => _ChatPreviewListState();
}

class _ChatPreviewListState extends State<ChatPreviewList> {
  Future<List<ChatPreviewData>> chatPreviews = dataProvider.getChatPreviews();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: chatPreviews,
      // initialData: List(),
      builder: (_, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data?.length,
                itemBuilder: (_, i) {
                  ChatPreviewData data = snapshot.data![i];

                  return ChatPreview(
                    icon: Icons.person,
                    userId: data.userId,
                    name: data.name,
                    messageText: data.messageText ?? 'No Message History',
                    messageTime: data.messageTime,
                    messageRead: false,
                  );
                })
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
