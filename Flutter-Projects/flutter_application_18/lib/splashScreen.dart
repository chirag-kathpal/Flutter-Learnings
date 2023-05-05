import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_18/introScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return IntroScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
            child: Text(
          'Classico',
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
    );
  }
}
