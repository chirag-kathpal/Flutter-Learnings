import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class dio extends StatefulWidget {
  const dio({super.key});

  @override
  State<dio> createState() => _dioState();
}

class _dioState extends State<dio> {
  final url = 'https://jsonplaceholder.typicode.com/todos';

  final all_todo = [];

  getdata() async {
    // final res1 = await http.get(Uri.parse(url));
    // print(res1.body);
    // var data = jsonDecode(res1.body);
    // for (var item in data) {
    //   all_todo.add(item);
    // }

    final res2 = await Dio().get(url);
    for (var item in res2.data) {
      all_todo.add(item);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP requests'),
        centerTitle: true,
      ),
      body: all_todo.length == 0
          ? const Center(
              child: Text(
                'Load Data',
                style: TextStyle(fontSize: 25),
              ),
            )
          : ListView.builder(
              itemBuilder: ((context, index) {
                return ListTile(
                  leading: Text('${all_todo[index]['id']}'),
                  title: Text(all_todo[index]['title']),
                );
              }),
              itemCount: all_todo.length,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getdata();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
