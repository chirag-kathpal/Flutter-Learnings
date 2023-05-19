import 'package:flutter/material.dart';
import 'package:project_1/counterApp/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);
    final total = counter.count;
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increment();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          'You pressed button\n$total times',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
