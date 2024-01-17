import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // REFERENCE BOX
  final _myBox = Hive.box('mybox');

  // TEXT CONTROLLER
  final _controller = TextEditingController();

  // LIST OF TODO TASKS
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // IF THIS IS THE 1ST TIME OPENING THE APP => CREATE DEFAULT DATA
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  //CHECK BOX TAPPED
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDb();
  }

  //SAVE NEW TASK
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDb();
  }

  //CREATE TASK
  void craeteNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCansel: () => Navigator.of(context).pop(),
          );
        });
  }

  //DELETE TASK
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        backgroundColor: Colors.yellow[300],
        title: Center(
          child: Text('To Do'),
        ),
        elevation: 0,
      ),
      // ACTION BUTTON
      floatingActionButton: FloatingActionButton(
        onPressed: craeteNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow[300],
      ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
