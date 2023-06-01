import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MyHomePages extends StatefulWidget {
  const MyHomePages({super.key});

  @override
  State<MyHomePages> createState() => _MyHomePagesState();
}

class _MyHomePagesState extends State<MyHomePages> {
  late final BehaviorSubject<String> subject;

  @override
  void initState() {
    super.initState();
    subject = BehaviorSubject<String>();
  }

  @override
  void dispose() async {
    await subject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: Container(),
    );
  }
}
