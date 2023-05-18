import 'package:flutter/material.dart';
import 'package:flutter_catalog/learnings/2.namesModel.dart';

class ModelClass extends StatefulWidget {
  const ModelClass({super.key});

  @override
  State<ModelClass> createState() => _ModelClassState();
}

class _ModelClassState extends State<ModelClass> {
  List<NamesModel> nameList = [
    NamesModel(name: 'Chirag', age: 23, profession: "developer"),
    NamesModel(name: 'Chiree', age: 2, profession: "developer"),
    NamesModel(name: 'Chwde', age: 256, profession: "developer"),
    NamesModel(name: 'frag', age: 27, profession: "developer"),
    NamesModel(name: 'lkirag', age: 29, profession: "developer"),
  ];
  // List<Names> nameList = [
  //   Names(name: 'Chirag', age: 23, dob: DateTime(1999, 05, 14)),
  //   Names(name: 'Chiree', age: 2, dob: DateTime(1999, 05, 14)),
  //   Names(name: 'Chwde', age: 256, dob: DateTime(1999, 05, 14)),
  //   Names(name: 'frag', age: 27, dob: DateTime(1999, 05, 14)),
  //   Names(name: 'lkirag', age: 29, dob: DateTime(1999, 05, 14)),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Model Class'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(nameList[index].name.toString()),
            subtitle: Text(nameList[index].age.toString()),
            trailing: IconButton(
              onPressed: () {
                nameList.removeAt(index);
                setState(() {});
              },
              icon: Icon(Icons.delete),
            ),
          );
        },
        itemCount: nameList.length,
      ),
    );
  }
}

class Names {
  String name;
  int age;
  DateTime dob;

  Names({required this.name, required this.age, required this.dob});
}
