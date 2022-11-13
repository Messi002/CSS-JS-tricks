// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

@immutable
abstract class LoadAction {
  const LoadAction();
}

@immutable
abstract class LoadPersonAction implements LoadAction {
  final PersonUrl url;
  const LoadPersonAction({required this.url}) : super();
}

enum PersonUrl { person1, person2 }

extension UrlString on PersonUrl {
  String get urlString {
    switch (this) {
      case PersonUrl.person1:
        return 'http://127.0.0.1:5500/app4/api/person1.json';
      case PersonUrl.person2:
        return 'http://127.0.0.1:5500/app4/api/person2.json';
    }
  }
}

@immutable
class Person {
  final String name;
  final int age;
  const Person({
    required this.name,
    required this.age,
  });

  Person copyWith({
    String? name,
    int? age,
  }) {
    return Person(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'age': age,
    };
  }

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'] as String,
      age: json['age'] as int,
    );
  }


  @override
  String toString() => 'Person(name: $name, age: $age)';

}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
    );
  }
}
