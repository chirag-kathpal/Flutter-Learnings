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
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result = '';
  var bgColor = Colors.blue.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BMI',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: wtController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('Enter Your Weight(In KGs)'),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: ftController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('Enter Your Height(In Feets)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: inchController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('Enter Your Height(In Inches'),
                      prefixIcon: Icon(Icons.height),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var weight = wtController.text.toString();
                        var feets = ftController.text.toString();
                        var inches = inchController.text.toString();

                        if (weight != '' && feets != '' && inches != '') {
                          // BMI calculation
                          var iWt = int.parse(weight);
                          var iFt = int.parse(feets);
                          var iIn = int.parse(inches);

                          var totalInches = iFt * 12 + iIn;

                          var totalCm = totalInches * 2.54;
                          var totalM = totalCm / 100;
                          var bmi = iWt / (totalM * totalM);
                          var msg = '';

                          if (bmi > 25) {
                            msg = "You're OverWeight!!";
                            bgColor = Colors.red.shade400;
                          } else if (bmi < 18) {
                            msg = "You're UnderWeight!!";
                            bgColor = Colors.red.shade200;
                          } else {
                            msg = "You're Healthy!!";
                            bgColor = Colors.green.shade200;
                          }

                          setState(() {
                            result = '$msg \n Your BMI is: ${bmi.toStringAsFixed(3)}';
                          });
                        } else {
                          setState(() {
                            result = 'Please fill all the Required Blanks';
                          });
                        }
                      },
                      child: Text('Calculate')),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
