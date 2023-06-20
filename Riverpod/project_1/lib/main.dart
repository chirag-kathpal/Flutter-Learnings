import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_1/models/user.dart';
import 'package:project_1/pages/homepage.dart';

// final nameProvider = Provider<String>((ref) {
//   return 'Chirag';
// });

// final nameProvider = StateProvider<String?>((ref) => null);
// To change the value of provider later on, we use stateProvider

final userProvider = StateNotifierProvider<UserNotifier, User>(
    (ref) => UserNotifier(const User(name: '', age: 0)));

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RiverPod',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

// Providers 
// Provider 
// StateProvider 
// StateNotifier and StateNotifierProvider 
// FutureProvider