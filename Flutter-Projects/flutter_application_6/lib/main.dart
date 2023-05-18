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
  var arrNames = ['raman', 'rama', 'hello', 'name', 'hii', 'byee'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              arrNames.add('abc');
              // print(arrNames);
            });
          },
          child: Icon(Icons.add),
        ),
        body: /* ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'One',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Two',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Three',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Four',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Five',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        )*/
            ListView.builder(
          itemBuilder: (context, index) {
            return ABC(name: arrNames[index]);
          },
          itemCount: arrNames.length,
          itemExtent: 100,
        ));
  }
}

class ABC extends StatelessWidget {
  ABC({super.key, required this.name});
  String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text(name),
      ),
    );
  }
}
