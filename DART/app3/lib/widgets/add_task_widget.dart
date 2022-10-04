import 'package:app3/blocs/bloc/tasks_bloc.dart';
import 'package:app3/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({
    Key? key,
    required TextEditingController titleController,
  })  : _titleController = titleController,
        super(key: key);

  final TextEditingController _titleController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Add Task...',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          TextField(
            autofocus: true,
            controller: _titleController,
            decoration: InputDecoration(
                hintText: 'start typing...',
                label: Text('Title'),
                border: OutlineInputBorder()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    var task = TaskModel(title: _titleController.text.trim());
                    context.read<TasksBloc>().add(AddTask(task: task));
                    _titleController.clear();
                    Navigator.of(context).pop();
                  },
                  child: Text('Add Task'))
            ],
          ),
        ],
      ),
    );
  }
}
