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
          title: Text(widget.title),
        ),
        body: /* TextButton(
          child: Text('Click here'),
          onPressed: () {
            print('text button pressed');
          },
          onLongPress: () {
            print("Long pressed");
          },
        )*/

            /*ElevatedButton(
          child: Text('Click me'),
          onPressed: (){
            print('elevated button pressed');
          },
        )*/

            /*OutlinedButton(
          child: Text('Outlined button'),
          onPressed: () {
            print("Outlined");
          },
        )*/

        Center(
          child: Image.asset('assets/images/cat.jpg'),
        )
        );
  }
}
