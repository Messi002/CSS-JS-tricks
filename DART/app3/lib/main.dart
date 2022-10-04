import 'package:app3/blocs/bloc_exports.dart';
import 'package:app3/models/task.dart';
import 'package:app3/screens/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bloc/tasks_bloc.dart';

void main() {
  // Bloc.observer = 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc()..add(AddTask(task: TaskModel(title: 'I think so...'))),
      //connecting it to the AddTask event for the first class in the TaskBloc
      // create: (context) => TasksBloc()..add(AddTask(task: TaskModel(title: 'I think so...'))),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TasksScreen(),
      ),
    );
  }
}
