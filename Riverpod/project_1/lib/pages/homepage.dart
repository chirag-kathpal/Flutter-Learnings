import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_1/main.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  void onSubmit(WidgetRef ref, String value) {
    // ref.read(nameProvider.notifier).update((state) => value);
    ref.read(userProvider.notifier).updateName(value);
  }

  void onSubmitAge(WidgetRef ref, String value) {
    // ref.read(nameProvider.notifier).update((state) => value);
    ref.read(userProvider.notifier).updateAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final name = ref.watch(nameProvider) ??
    //     ""; // continously keep listening the provider
    // final nameRead = ref.read(nameProvider); // read only once

    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      // extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Center(
            child: TextField(
              onSubmitted: (value) => onSubmit(ref, value),
              decoration: const InputDecoration(
                hintText: 'Enter your name',
                labelText: 'name',
              ),
            ),
          ),
          Center(
            child: TextField(
              onSubmitted: (value) => onSubmitAge(ref, value),
              decoration: const InputDecoration(
                hintText: 'Enter your age',
                labelText: 'age',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(user.age.toString()),
            ),
          ),
        ],
      ),
    );
  }
}
