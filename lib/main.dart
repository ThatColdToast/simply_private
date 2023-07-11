import 'package:flutter/material.dart';
import 'package:simply_private/chat_preview.dart';
import 'package:simply_private/data_provider.dart';

late DataProvider dataProvider;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dataProvider = DataProvider();
  await dataProvider.open();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue, title: const Text("Simply Private")),
        body: ListView.builder(
          itemBuilder: (_, index) {
            return const ChatPreview();
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            print("Create Chat!");
          },
        ),
      ),
    );
  }
}
