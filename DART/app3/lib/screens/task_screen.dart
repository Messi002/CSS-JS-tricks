import 'package:app3/models/task.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);

  List<TaskModel> taskList = [
    TaskModel(title: 'Task1'),
    TaskModel(title: 'Task2'),
    TaskModel(title: 'Task3')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Center(
            child: Chip(
              label: Text(
                'Tasks:',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
                itemCount: taskList.length,
                itemBuilder: (BuildContext context, int index) {
                  var task = taskList[index];
                  return ListTile(
                    title: Text(task.title),
                    trailing: Checkbox(value: task.isDone, onChanged:(value){}  ),
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
