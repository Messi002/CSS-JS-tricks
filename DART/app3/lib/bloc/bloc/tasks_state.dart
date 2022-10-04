part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<TaskModel> allTasks;

  //initializing the taskstate to an empty array
  const TasksState({
    this.allTasks=const <TaskModel>[],
  });

  @override
  List<Object> get props => [allTasks];
}
