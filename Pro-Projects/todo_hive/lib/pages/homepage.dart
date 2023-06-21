import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_hive/data/database.dart';
import 'package:todo_hive/utils/dialog_box.dart';
import 'package:todo_hive/utils/todo_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the first time ever opening the app, then create default data
    if (_myBox.get("ToDoList") == null) {
      db.createInitialData();
    } else {
      // there already exists some data
      db.loadData();
    }

    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateDataBase();
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deletetask(index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade100,
      appBar: AppBar(
        title: const Text('ToDo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.amberAccent,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            onChanged: (value) => checkboxChanged(value, index),
            taskCompleted: db.todoList[index][1],
            taskName: db.todoList[index][0],
            deleteFunction: (context) => deletetask(index),
          );
        },
      ),
    );
  }
}
