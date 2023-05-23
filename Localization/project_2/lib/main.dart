import 'package:flutter/material.dart';
import 'package:project_2/localiation_servce/localization_service.dart';
import 'package:project_2/screens/homepage.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localeResolutionCallback: LocalizationService.localeResolutionCallback,
      supportedLocales: LocalizationService.supportedLocales,
      localizationsDelegates: LocalizationService.localizationDelegate,
      home: const MyHomePage(),
    );
  }
}
