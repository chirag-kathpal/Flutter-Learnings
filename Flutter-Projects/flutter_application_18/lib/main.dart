import 'package:flutter/material.dart';
import 'package:flutter_application_18/splashScreen.dart';
import 'introScreen.dart';

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
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: IntroScreen(),
      home: SplashScreen(),
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
          title: Text('Classico'),
        ),
        body: /*ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 200, maxHeight: 100),
            child: const Text(
              'Hello World',
              style: TextStyle(fontSize: 25, overflow: TextOverflow.fade),
            ))*/

              Text('Hello World')


            );
  }
}
