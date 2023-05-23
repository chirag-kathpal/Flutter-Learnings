import 'package:flutter/material.dart';
import 'package:project_2/localiation_servce/localization_service.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Json Localization'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(children: [
        Text(LocalizationService.of(context).translate('hello')!),
        Text(LocalizationService.of(context).translate('info')!)
      ]),
    );
  }
}
