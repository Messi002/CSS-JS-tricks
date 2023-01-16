import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class TaskModel extends Equatable{
  final String title;
  bool? isDone;
  bool? isDeleted;

  TaskModel({
    required this.title,
    this.isDone,
    this.isDeleted,
  }) {
    //this is for initialization...
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  TaskModel copyWith({
    String? title,
    bool? isDone,
    bool? isDeleted,
  }) {
    return TaskModel(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }



  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }
  
  @override
  List<Object?> get props => [title, isDeleted, isDone];

  
}
