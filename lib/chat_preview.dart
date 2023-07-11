import 'package:flutter/material.dart';
import 'package:simply_private/main.dart';

class ChatPreview extends StatefulWidget {
  const ChatPreview({super.key});

  @override
  State<ChatPreview> createState() => _ChatPreviewState();
}

class _ChatPreviewState extends State<ChatPreview> {
  Future<String> name = Future<String>.delayed(
    const Duration(seconds: 1),
    () => "Scott",
  );

  Future<String> message = Future<String>.delayed(
    const Duration(seconds: 1),
    () => "Sup man! How's it been?",
  );

  Future<List<String>> messages = dataProvider.getMessages();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: const Icon(Icons.person),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<String>(
                  future: name,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text("${snapshot.data}", textScaleFactor: 2);
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                FutureBuilder<List<String>>(
                  future: messages,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data?.first ?? '');
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
