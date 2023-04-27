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
        primarySwatch: Colors.orange,
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Text('R',style: TextStyle(fontSize: 20),),
          Text('S',style: TextStyle(fontSize: 20),),
          Text('T',style: TextStyle(fontSize: 20),),
          Text('U',style: TextStyle(fontSize: 20),)
            ],
          ),
          Text('A',style: TextStyle(fontSize: 20),),
          Text('B',style: TextStyle(fontSize: 20),),
          Text('C',style: TextStyle(fontSize: 20),),
          Text('D',style: TextStyle(fontSize: 20),),
        ],
      )
    );
  }
}
