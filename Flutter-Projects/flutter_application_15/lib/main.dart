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
    var arrColors = [
      Colors.red,
      Colors.green,
      Colors.redAccent,
      Colors.blueGrey,
      Colors.limeAccent,
      Colors.pink,
      Colors.brown,
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: /*Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select Date',
                style: TextStyle(fontSize: 25),
              ),
              ElevatedButton(
                  onPressed: () async{
                    DateTime? datePicked =await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1999),
                        lastDate: DateTime(2025)
                        );
                  },
                  child: Text('Show'))
            ],
          ),
        )*/

            /*Container(
              width: 200,
              child: GridView.count(crossAxisCount: 3, /*crossAxisSpacing: 11,*/ /*mainAxisSpacing: 11,*/
              children: [
                Container(color: Colors.red,margin: EdgeInsets.all(5),),
                Container(color: Colors.green,margin: EdgeInsets.all(5),),
                Container(color: Colors.amber,margin: EdgeInsets.all(5),),
                Container(color: Colors.black,margin: EdgeInsets.all(5),),
                Container(color: Colors.blueAccent,margin: EdgeInsets.all(5),),
                Container(color: Colors.grey,margin: EdgeInsets.all(5),),
                Container(color: Colors.deepPurple,margin: EdgeInsets.all(5),),
              ],
              ),
            )*/

            GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 11,
            mainAxisSpacing: 11
          ),
          itemBuilder: (context, index) {
            return Container(
              color: arrColors[index],
            );
          },
          itemCount: arrColors.length,
        ));
  }
}
