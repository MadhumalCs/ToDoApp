// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, top: 25.0, left: 25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion, children: children),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              //CHECK BOX
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.yellow[700],
              ),
              // TASK NAME
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.yellow[100],
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
