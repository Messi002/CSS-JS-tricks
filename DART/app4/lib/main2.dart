// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer' as devtools show log;

import 'package:flutter/material.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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

enum PersonsUrl { person1, person2 }

extension UrlString on PersonsUrl {
  String get urlString {
    switch (this) {
      case PersonsUrl.person1:
        return 'http://127.0.0.1:5500/app4/api/person1.json';
      case PersonsUrl.person2:
        return 'http://127.0.0.1:5500/app4/api/person2.json';
    }
  }
}

class Person {
  final String name;
  final int age;
  Person({
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

  @immutable
  abstract class LoadAction{}

  class LoadPersonAction implements LoadAction{}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
