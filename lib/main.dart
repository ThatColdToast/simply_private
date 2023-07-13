import 'package:flutter/material.dart';
import 'package:simply_private/chat_preview/chat_preview_list.dart';
import 'package:simply_private/local_data_provider.dart';

late DataProvider dataProvider;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  dataProvider = DataProvider();
  await dataProvider.init();
  await dataProvider.open();
  // await dataProvider.delete();
  // await dataProvider.dummyDataScott();
  // await dataProvider.dummyDataFredrick();
  // await dataProvider.dummyDataBrice();
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

        body: ChatPreviewList(),

        // body: FutureBuilder(
        //   future: chatPreviews,
        //   initialData: List(),
        //   builder: (_, snapshot) {
        //     return snapshot.hasData
        //         ? ListView.builder(
        //             scrollDirection: Axis.vertical,
        //             itemBuilder: (_, i) {
        //               return const ChatPreview();
        //             })
        //         : Center(
        //             child: CircularProgressIndicator(),
        //           );
        //   },
        // ),

        // body: ListView.builder(
        //   scrollDirection: Axis.vertical,
        //   itemBuilder: (_, index) {
        //     return const ChatPreview();
        //   },
        // ),
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
