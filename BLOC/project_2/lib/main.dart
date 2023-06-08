import 'package:flutter/material.dart';
import 'package:project_2/pages/homepage.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          // centerTitle: true,
          backgroundColor: Colors.pinkAccent,
          elevation: 0.0,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

// BLOC is a Business layer, which seperate UI logic and network logic 