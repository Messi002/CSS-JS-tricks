import 'package:app3/models/task.dart';
import 'package:flutter/material.dart';




class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<TaskModel> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: taskList.length,
          itemBuilder: (BuildContext context, int index) {
            var task = taskList[index];
            return ListTile(
              title: Text(task.title),
              trailing: Checkbox(
                  value: task.isDone,
                  onChanged: (value) {
                    // value!;
                  }),
            );
          }),
    );
  }
}