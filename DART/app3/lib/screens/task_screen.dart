import 'package:app3/blocs/bloc/tasks_bloc.dart';
import 'package:app3/models/task.dart';
import 'package:app3/widgets/task_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  children: [
                   const Text('Add Task...',style: TextStyle(fontSize: 14),),
                   const SizedBox(height: 16),
                    TextField(
                      controller: _titleController,
                    ),
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<TaskModel> taskList = state.allTasks;
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
              TaskList(taskList: taskList)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: ()=> _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
