import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rxdart/rxdart.dart';

class MyHomePage extends HookWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // create our behaviour subject everytime widget is rebuilt
    final subject = useMemoized(
      () => BehaviorSubject<String>(),
      [key],
    );

    // dispose of the old subject everytime widget is rebuilt
    useEffect(
      () => subject.close,
      [subject],
    );

    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<String>(
          stream: subject.stream
              .distinct()
              .debounceTime(const Duration(seconds: 1)),
          initialData: 'Please Start typing....',
          builder: (context, snapshot) {
            return Text(snapshot.requireData);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: (string) {
            subject.sink.add(string);
          },
        ),
      ),
    );
  }
}

// behaviourSubject is a stream and uses StreamController
// StreamController is both read and write, we can expose the property of streams to outside
// sink is write only and stream is read only 