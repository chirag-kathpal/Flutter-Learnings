import 'package:flutter/material.dart';
import 'package:project_1/counterApp/counter_app.dart';
import 'package:project_1/counterApp/counter_provider.dart';
import 'package:project_1/pages/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Provider',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
                centerTitle: true,
                backgroundColor: Colors.purple,
                elevation: 5.0)),
        home: const CounterApp(),
      ),
    );
  }
}
