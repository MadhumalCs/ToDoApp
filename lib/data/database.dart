import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  //REFERENCE THE BOX
  final _myBox = Hive.box('mybox');

  //RUN THIS METHOD IF THE APP STARTED 1ST TIME EVER
  void createInitialData() {
    toDoList = [
      ["Make Tutorials", false],
      ["Do Exercise", false],
    ];
  }

  // LOAD DATA FROM DATABASE
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //UPDATE THE DATABASE
  void updateDb() {
    _myBox.put("TODOLIST", toDoList);
  }
}
