import 'package:flutter/material.dart';
import 'package:flutter_application_13/ui_helper/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),
          displaySmall: TextStyle(fontSize: 11,fontWeight: FontWeight.w500),
        )
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
      body:  /*Container(
        margin: const EdgeInsets.all(15),
        child: const Text("Hello World",style: TextStyle(fontFamily: 'Font1'),)
        )*/
            Column(
              children: [
                Text("Hello",style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.green)),
                Text("Hello",style: Theme.of(context).textTheme.displaySmall),
                Text("Hello",style: mTextStyle11(),),
                Text("Hello",style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.cyan)),
              ],
            )
      );
  }
}
