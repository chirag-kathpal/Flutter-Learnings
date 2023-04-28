import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: InkWell(
            onTap: () {
              print("On tapped");
            },
            onDoubleTap: () {
              print("On double tapped");
            },
            onLongPress: () {
              print("on long pressed");
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.amberAccent,
              child: Center(
                  child: InkWell(
                onTap: () {
                  print("tapped on text");
                },
                child: const Text(
                  "Click here",
                  style: TextStyle(
                      backgroundColor: Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              )),
            ),
          ),
        ));
  }
}
