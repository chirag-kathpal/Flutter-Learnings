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
  var no1Controller = TextEditingController();
  var no2Controller = TextEditingController();

  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Basic Calculator'),
        ),
        body: Container(
          color: Colors.blue.shade100,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: no1Controller,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: no2Controller,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            var number1 =
                                int.parse(no1Controller.text.toString());
                            var number2 =
                                int.parse(no2Controller.text.toString());
                            var sum = number1 + number2;
                            result = "The Sum of $number1 and $number2 is $sum";
                            setState(() {});
                          },
                          child: Text('Addition')),
                      ElevatedButton(
                          onPressed: () {
                            var number1 =
                                int.parse(no1Controller.text.toString());
                            var number2 =
                                int.parse(no2Controller.text.toString());
                            var sub = number1 - number2;
                            result =
                                "The Subtraction of $number1 and $number2 is $sub";
                            setState(() {});
                          },
                          child: Text('Subtract')),
                      ElevatedButton(
                          onPressed: () {
                            var number1 =
                                int.parse(no1Controller.text.toString());
                            var number2 =
                                int.parse(no2Controller.text.toString());
                            var mul = number1 * number2;
                            result =
                                "The Multiplication of $number1 and $number2 is $mul";
                            setState(() {});
                          },
                          child: Text('Multiply')),
                      ElevatedButton(
                          onPressed: () {
                            var number1 =
                                int.parse(no1Controller.text.toString());
                            var number2 =
                                int.parse(no2Controller.text.toString());
                            var div = number1 / number2;
                            result =
                                "The Division of $number1 and $number2 is ${div.toStringAsFixed(2)}";
                            setState(() {});
                          },
                          child: Text('Divide')),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(21),
                    child: Text(
                      result,
                      style: TextStyle(fontSize: 25, color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
