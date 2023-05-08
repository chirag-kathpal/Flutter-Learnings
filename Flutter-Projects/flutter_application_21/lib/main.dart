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
  var _width = 200.0;
  var _height = 100.0;
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
              AnimatedContainer(
                color: Colors.blue.shade200,
                duration: Duration(seconds: 2),
                width: _width,
                height: _height,
                curve: Curves.fastLinearToSlowEaseIn,
              ),
              const SizedBox(height: 16,),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (flag) {
                        _width = 100.0;
                        _height = 200.0;
                        flag = false;
                        // we can add color and decoration(for border radius and all) too 
                      } else {
                        _width = 200.0;
                        _height = 100.0;
                        flag = true;
                      }
                    });
                  },
                  child: const Text('Animate!!'))
            ],
          ),
        ));
  }
}
