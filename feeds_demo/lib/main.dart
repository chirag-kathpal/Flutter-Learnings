import 'package:feeds_demo/screens/select_user_page.dart';
import 'package:flutter/material.dart';
import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';

Future<void> main() async {
  const apiKey = '8rfsjstrr2v8';
  final client = StreamFeedClient(apiKey);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(client: client),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.client,
  }) : super(key: key);

  final StreamFeedClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => FeedProvider(
        bloc: FeedBloc(
          client: client,
        ),
        child: child!,
      ),
      home: const SelectUserPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
