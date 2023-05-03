import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    var time=DateTime.now();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: /* const Card(
          shadowColor: Colors.blueAccent,
          elevation: 5,
            child:Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                      'Hello World',
                      style: TextStyle(fontSize: 21),
                    ),
            ))*/
              
              /*Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Current time: $time"),
                  Text('Month: ${time.month}'),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      
                    });
                  }, child: const Text('Current Time')
                  )
                ],
              )*/

              Text('Current Time: ${DateFormat('Hms').format(time)}',style: TextStyle(fontSize: 21),)
              
            );
  }
}
