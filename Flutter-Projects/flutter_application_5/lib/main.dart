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
        primarySwatch: Colors.blue,
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
        backgroundColor: Colors.orangeAccent.shade700,
      title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                    Container(
                    height: 200,
                    width: 200,
                    color: Colors.orange,
                    margin: const EdgeInsets.only(right: 11),
                  ),
                    Container(
                    height: 200,
                    width: 200,
                    color: Colors.red,
                    margin: const EdgeInsets.only(right: 11),
                  ),
                    Container(
                    height: 200,
                    width: 200,
                    color: Colors.yellow,
                    margin: const EdgeInsets.only(right: 11),
                  ),
                    Container(
                    height: 200,
                    width: 200,
                    color: Colors.pink,
                    margin: const EdgeInsets.only(right: 11),
                  ),
                    Container(
                    height: 200,
                    width: 200,
                    color: Colors.blueGrey,
                    margin: const EdgeInsets.only(right: 11),
                  ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.green,
                margin: const EdgeInsets.only(bottom: 11),
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.red,
                margin: const EdgeInsets.only(bottom: 11),
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.yellow,
                margin: const EdgeInsets.only(bottom: 11),
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.pink,
                margin: const EdgeInsets.only(bottom: 11),
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.green,
                margin: const EdgeInsets.only(bottom: 11),
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.red,
                margin: const EdgeInsets.only(bottom: 11),
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.yellow,
                margin: const EdgeInsets.only(bottom: 11),
              ),
            ],
          ),
        ),
      )
    );
  }
}
