import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List todoList = [];
  // reference the box
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening of the app
  void createInitialData() {
    todoList = [
      ["Make App", false],
      ["exercise", false],
    ];
  }

  // load the data from the database
  void loadData() {
    todoList = _myBox.get("ToDoList");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("ToDoList", todoList);
  }
}
