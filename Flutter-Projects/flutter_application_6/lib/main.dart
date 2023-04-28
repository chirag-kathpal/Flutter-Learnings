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
  @override
  Widget build(BuildContext context) {
    var arrNames = ['raman', 'rama', 'hello', 'name','hii','byee'];
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: /* ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('One',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Two',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Three',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Four',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Five',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
          ),
        ],
      ) */
            ListView.builder(
          itemBuilder: (context, index) {
            return Text(
              arrNames[index],
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            );
          },
          itemCount: arrNames.length,
          itemExtent: 100,
        ));
  }
}
