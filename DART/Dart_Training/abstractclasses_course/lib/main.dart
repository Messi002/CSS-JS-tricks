import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

abstract class CanRun {
  String get type {
    if (this is Cat) {
      return 'Cat';
    } else {
      return 'something else';
    }
  }

  @mustCallSuper
  void run() {
    'CanRun run function is being called'.log();
  }
}

class Dog extends CanRun {}

class Cat extends CanRun {
  @override
  void run() {
    super.run();
    'Cat function called'.log();
  }
}

void testIt() {
  final cat = Cat();
  cat.type.log();
  final dog = Dog();
  dog.type.log();
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    testIt();
    return Scaffold(
      body: Container(),
    );
  }
}
