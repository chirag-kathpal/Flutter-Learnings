import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:project_1/model/models.dart';

import '../services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<dynamic> users = [];
  List<User> users = [];

  // API call without floating action button
  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest Api Call'),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: fetchUsers,
      //   child: const Icon(Icons.refresh),
      // ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final user = users[index];
          // final email = user['email'];
          final email = user.email;
          // final name = user['name']['first'];
          final color =
              user.gender == 'male' ? Colors.blue : Colors.pink.shade300;
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            // title: Text(email),
            title: Text(user.fullName),
            subtitle: Text(user.cell),
            tileColor: color,
          );
        },
        itemCount: users.length,
      ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await FetchUserApi.fetchUsers();
    users = response;
    setState(() {});
  }
}
