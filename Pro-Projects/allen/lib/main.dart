import 'package:allen/pages/homepage.dart';
import 'package:allen/utils/pallete.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Allen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        scaffoldBackgroundColor: Pallete.whiteColor,
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: Pallete.whiteColor,
          centerTitle: true,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
