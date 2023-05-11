import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Catalog App')),
      body: Center(
        child: Container(
          child: Text('Hello'),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
