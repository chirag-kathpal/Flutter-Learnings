import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  var nameController = TextEditingController();
  var namevalue = "No Value Saved";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shared Preferences'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  label: Text('name'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21))),
            ),
            ElevatedButton(
                onPressed: () async {
                  var name = nameController.text.toString();

                  var prefs = await SharedPreferences.getInstance();
                  prefs.setString("name", name);
                },
                child: Text('Save!')),
            SizedBox(
              height: 11,
            ),
            Text(namevalue)
          ],
        ));
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();

    var getName = prefs.getString("name");
    namevalue = getName!=null ? getName :"No Value Saved";  
    setState(() {
       
    });
  }
}
