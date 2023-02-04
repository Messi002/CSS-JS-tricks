// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

void main(List<String> args) async {}

void _parseJsonIsolateEntry(SendPort sp) async {
  final client = HttpClient();
  final uri = Uri.parse('https://jsonplaceholder.typicode.com/todos/');

  final todos = await client
      .getUrl(uri)
      .then((req) => req.close())
      .then((res) => res.transform(utf8.decoder).join())
      .then((json) => jsonDecode(json) as List<dynamic>)
      .then((value) => value.map((e) => Todo.fromJson(e)));

  sp.send(todos);
}

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool isCompleted;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  Todo copyWith({
    int? userId,
    int? id,
    String? title,
    bool? isCompleted,
  }) {
    return Todo(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
    };
  }

  Todo.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'] as int,
        title = json['title'] as String,
        isCompleted = json['isCompleted'] as bool;

  @override
  String toString() {
    return 'Todo(userId: $userId, id: $id, title: $title, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        id.hashCode ^
        title.hashCode ^
        isCompleted.hashCode;
  }
}
