import 'package:flutter/material.dart';
import 'package:todo_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCansel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCansel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[100],
      content: Container(
        height: 120,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          // GET USER INPUT
          TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Add a new task."),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //SAVE BTN
              MyButton(text: "Save", onPressed: onSave),
              const SizedBox(
                width: 10,
              ),
              //CANSEL BTN
              MyButton(text: "Cansel", onPressed: onCansel),
            ],
          )
        ]),
      ),
    );
  }
}
