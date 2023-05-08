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
  var myOpacity = 1.0;
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: myOpacity,
                duration: Duration(seconds: 2),
                curve: Curves.linear,
                child: Container(
                  width: 200,
                  height: 100,
                  color: Colors.blue,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (flag) {
                        myOpacity = 0.0;
                        flag = false;
                      } else {
                        myOpacity = 1.0;
                        flag = true;
                      }
                    });
                  },
                  child: const Text('Close'))
            ],
          ),
        ));
  }
}
